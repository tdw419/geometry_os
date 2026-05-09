; DESCRIPTION: Composite: . Then Places a white line segment connecting (226, 214) to (162, 220). Then Draws a white rectangle at (48, 73) with width 114 and height 74.
; PLAN: r0=226(x1), r1=214(y1), r2=162(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=48(x), r1=73(y), r2=114(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a white line segment connecting (226, 214) to (162, 220).
; PLAN: r0=226(x1), r1=214(y1), r2=162(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 214
LDI r2, 162
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Draws a white rectangle at (48, 73) with width 114 and height 74.
; PLAN: r0=48(x), r1=73(y), r2=114(width), r3=74(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 73
LDI r2, 114
LDI r3, 74
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
