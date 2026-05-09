; DESCRIPTION: Composite: . Then Draws a red line from (70, 136) to (64, 239). Then Creates a blue circular shape at (74, 132) with radius 14.
; PLAN: r0=70(x1), r1=136(y1), r2=64(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=74(x), r1=132(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red line from (70, 136) to (64, 239).
; PLAN: r0=70(x1), r1=136(y1), r2=64(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 136
LDI r2, 64
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Creates a blue circular shape at (74, 132) with radius 14.
; PLAN: r0=74(x), r1=132(y), r2=14(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 74
LDI r1, 132
LDI r2, 14
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
HALT
