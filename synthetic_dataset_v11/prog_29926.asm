; DESCRIPTION: Composite: . Then Draws a white line from (2, 79) to (185, 161). Then Creates a magenta rectangular region at (28, 88) spanning 89 by 119 pixels.
; PLAN: r0=2(x1), r1=79(y1), r2=185(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=28(x), r1=88(y), r2=89(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a white line from (2, 79) to (185, 161).
; PLAN: r0=2(x1), r1=79(y1), r2=185(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 79
LDI r2, 185
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a magenta rectangular region at (28, 88) spanning 89 by 119 pixels.
; PLAN: r0=28(x), r1=88(y), r2=89(width), r3=119(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 88
LDI r2, 89
LDI r3, 119
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
