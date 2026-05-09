; DESCRIPTION: Composite: . Then Places a red line segment connecting (173, 79) to (101, 44). Then Draws a purple rectangle at (25, 29) with width 65 and height 45.
; PLAN: r0=173(x1), r1=79(y1), r2=101(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=25(x), r1=29(y), r2=65(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a red line segment connecting (173, 79) to (101, 44).
; PLAN: r0=173(x1), r1=79(y1), r2=101(x2), r3=44(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 79
LDI r2, 101
LDI r3, 44
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a purple rectangle at (25, 29) with width 65 and height 45.
; PLAN: r0=25(x), r1=29(y), r2=65(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 29
LDI r2, 65
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
