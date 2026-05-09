; DESCRIPTION: Draws a black rectangle at (204, 160) with width 36 and height 32.
; PLAN: r0=204(x), r1=160(y), r2=36(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 160
LDI r2, 36
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
