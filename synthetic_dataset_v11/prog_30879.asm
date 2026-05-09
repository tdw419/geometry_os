; DESCRIPTION: Composite: . Then Draws a blue rectangle at (91, 30) with width 116 and height 112. Then Places a purple dot at position (14, 219).
; PLAN: r0=91(x), r1=30(y), r2=116(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=14(x), r1=219(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue rectangle at (91, 30) with width 116 and height 112.
; PLAN: r0=91(x), r1=30(y), r2=116(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 30
LDI r2, 116
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a purple dot at position (14, 219).
; PLAN: r0=14(x), r1=219(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2.
LDI r0, 14
LDI r1, 219
LDI r2, 0xAA00FF
PSET r0, r1, r2
HALT
