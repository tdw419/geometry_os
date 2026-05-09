; DESCRIPTION: Draws a green rectangle at (402, 200) with width 27 and height 32.
; PLAN: r0=402(x), r1=200(y), r2=27(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 402
LDI r1, 200
LDI r2, 27
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
