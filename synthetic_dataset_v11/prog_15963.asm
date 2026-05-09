; DESCRIPTION: Composite: . Then Creates a white circular shape at (114, 157) with radius 70. Then Draws a blue line from (99, 136) to (37, 16).
; PLAN: r0=114(x), r1=157(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=99(x1), r1=136(y1), r2=37(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Creates a white circular shape at (114, 157) with radius 70.
; PLAN: r0=114(x), r1=157(y), r2=70(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 114
LDI r1, 157
LDI r2, 70
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue line from (99, 136) to (37, 16).
; PLAN: r0=99(x1), r1=136(y1), r2=37(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 136
LDI r2, 37
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
