; DESCRIPTION: Composite: . Then Creates a blue rectangular region at (75, 79) spanning 46 by 86 pixels. Then Renders a orange line between points (47, 119) and (156, 249).
; PLAN: r0=75(x), r1=79(y), r2=46(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=47(x1), r1=119(y1), r2=156(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a blue rectangular region at (75, 79) spanning 46 by 86 pixels.
; PLAN: r0=75(x), r1=79(y), r2=46(width), r3=86(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 79
LDI r2, 46
LDI r3, 86
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange line between points (47, 119) and (156, 249).
; PLAN: r0=47(x1), r1=119(y1), r2=156(x2), r3=249(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 119
LDI r2, 156
LDI r3, 249
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
