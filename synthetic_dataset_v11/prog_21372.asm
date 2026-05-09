; DESCRIPTION: Composite: . Then Draws a blue circle centered at (174, 115) with radius 70. Then Draws a red line from (96, 67) to (234, 240).
; PLAN: r0=174(x), r1=115(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=96(x1), r1=67(y1), r2=234(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue circle centered at (174, 115) with radius 70.
; PLAN: r0=174(x), r1=115(y), r2=70(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 174
LDI r1, 115
LDI r2, 70
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red line from (96, 67) to (234, 240).
; PLAN: r0=96(x1), r1=67(y1), r2=234(x2), r3=240(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 67
LDI r2, 234
LDI r3, 240
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
