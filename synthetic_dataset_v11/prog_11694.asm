; DESCRIPTION: Composite: . Then Places a green circle of radius 33 at center (100, 219). Then Draws a cyan rectangle at (132, 77) with width 114 and height 66.
; PLAN: r0=100(x), r1=219(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=132(x), r1=77(y), r2=114(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a green circle of radius 33 at center (100, 219).
; PLAN: r0=100(x), r1=219(y), r2=33(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 100
LDI r1, 219
LDI r2, 33
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan rectangle at (132, 77) with width 114 and height 66.
; PLAN: r0=132(x), r1=77(y), r2=114(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 77
LDI r2, 114
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
