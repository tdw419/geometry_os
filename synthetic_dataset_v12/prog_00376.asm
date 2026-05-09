; DESCRIPTION: Draws a yellow rectangle at (110, 131) with width 32 and height 38.
; PLAN: r0=110(x), r1=131(y), r2=32(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 131
LDI r2, 32
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
