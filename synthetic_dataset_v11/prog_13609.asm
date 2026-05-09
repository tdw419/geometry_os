; DESCRIPTION: Composite: . Then Draws a blue rectangle at (14, 16) with width 38 and height 52. Then Places a green dot at position (220, 72).
; PLAN: r0=14(x), r1=16(y), r2=38(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=220(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Draws a blue rectangle at (14, 16) with width 38 and height 52.
; PLAN: r0=14(x), r1=16(y), r2=38(width), r3=52(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 14
LDI r1, 16
LDI r2, 38
LDI r3, 52
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Places a green dot at position (220, 72).
; PLAN: r0=220(x), r1=72(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 220
LDI r1, 72
LDI r2, 0x00FF00
PSET r0, r1, r2
HALT
