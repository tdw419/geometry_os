; DESCRIPTION: Composite: . Then Draws a purple rectangle at (135, 101) with width 75 and height 18. Then Renders a magenta line between points (149, 242) and (20, 82).
; PLAN: r0=135(x), r1=101(y), r2=75(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=149(x1), r1=242(y1), r2=20(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a purple rectangle at (135, 101) with width 75 and height 18.
; PLAN: r0=135(x), r1=101(y), r2=75(width), r3=18(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 101
LDI r2, 75
LDI r3, 18
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a magenta line between points (149, 242) and (20, 82).
; PLAN: r0=149(x1), r1=242(y1), r2=20(x2), r3=82(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 242
LDI r2, 20
LDI r3, 82
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
