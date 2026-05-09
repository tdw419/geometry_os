; DESCRIPTION: Composite: . Then Creates a cyan rectangular region at (127, 37) spanning 115 by 73 pixels. Then Renders a magenta line between points (83, 224) and (203, 41).
; PLAN: r0=127(x), r1=37(y), r2=115(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=83(x1), r1=224(y1), r2=203(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a cyan rectangular region at (127, 37) spanning 115 by 73 pixels.
; PLAN: r0=127(x), r1=37(y), r2=115(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 127
LDI r1, 37
LDI r2, 115
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (83, 224) and (203, 41).
; PLAN: r0=83(x1), r1=224(y1), r2=203(x2), r3=41(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 224
LDI r2, 203
LDI r3, 41
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
