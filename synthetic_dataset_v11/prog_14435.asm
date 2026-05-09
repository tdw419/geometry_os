; DESCRIPTION: Composite: . Then Draws a blue rectangle at (182, 131) with width 62 and height 35. Then Draws a black line from (103, 52) to (102, 182).
; PLAN: r0=182(x), r1=131(y), r2=62(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=103(x1), r1=52(y1), r2=102(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a blue rectangle at (182, 131) with width 62 and height 35.
; PLAN: r0=182(x), r1=131(y), r2=62(width), r3=35(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 131
LDI r2, 62
LDI r3, 35
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Draws a black line from (103, 52) to (102, 182).
; PLAN: r0=103(x1), r1=52(y1), r2=102(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 52
LDI r2, 102
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
