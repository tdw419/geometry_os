; DESCRIPTION: Draws a yellow rectangle at (418, 64) with width 32 and height 69.
; PLAN: r0=418(x), r1=64(y), r2=32(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 418
LDI r1, 64
LDI r2, 32
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
