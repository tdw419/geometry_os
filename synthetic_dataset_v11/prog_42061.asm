; DESCRIPTION: Composite: . Then Places a blue circle of radius 77 at center (104, 85). Then Draws a cyan rectangle at (121, 105) with width 37 and height 64.
; PLAN: r0=104(x), r1=85(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=121(x), r1=105(y), r2=37(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Places a blue circle of radius 77 at center (104, 85).
; PLAN: r0=104(x), r1=85(y), r2=77(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 104
LDI r1, 85
LDI r2, 77
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a cyan rectangle at (121, 105) with width 37 and height 64.
; PLAN: r0=121(x), r1=105(y), r2=37(width), r3=64(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 121
LDI r1, 105
LDI r2, 37
LDI r3, 64
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
