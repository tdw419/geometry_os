; DESCRIPTION: Composite: . Then Draws a black line from (63, 21) to (27, 134). Then Creates a magenta rectangular region at (20, 90) spanning 20 by 23 pixels.
; PLAN: r0=63(x1), r1=21(y1), r2=27(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=20(x), r1=90(y), r2=20(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black line from (63, 21) to (27, 134).
; PLAN: r0=63(x1), r1=21(y1), r2=27(x2), r3=134(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 21
LDI r2, 27
LDI r3, 134
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta rectangular region at (20, 90) spanning 20 by 23 pixels.
; PLAN: r0=20(x), r1=90(y), r2=20(width), r3=23(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 90
LDI r2, 20
LDI r3, 23
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
