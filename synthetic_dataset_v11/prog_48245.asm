; DESCRIPTION: Composite: . Then Draws a black circle centered at (210, 145) with radius 43. Then Draws a blue rectangle at (83, 100) with width 116 and height 51.
; PLAN: r0=210(x), r1=145(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=83(x), r1=100(y), r2=116(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Draws a black circle centered at (210, 145) with radius 43.
; PLAN: r0=210(x), r1=145(y), r2=43(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 210
LDI r1, 145
LDI r2, 43
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a blue rectangle at (83, 100) with width 116 and height 51.
; PLAN: r0=83(x), r1=100(y), r2=116(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 100
LDI r2, 116
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
