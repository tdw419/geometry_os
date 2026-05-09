; DESCRIPTION: Composite: . Then Draws a green rectangle at (96, 114) with width 119 and height 115. Then Draws a black line from (33, 92) to (239, 73).
; PLAN: r0=96(x), r1=114(y), r2=119(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=33(x1), r1=92(y1), r2=239(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a green rectangle at (96, 114) with width 119 and height 115.
; PLAN: r0=96(x), r1=114(y), r2=119(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 114
LDI r2, 119
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black line from (33, 92) to (239, 73).
; PLAN: r0=33(x1), r1=92(y1), r2=239(x2), r3=73(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 92
LDI r2, 239
LDI r3, 73
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
