; DESCRIPTION: Draws a yellow rectangle at (131, 60) with width 95 and height 64.
; PLAN: r0=131(x), r1=60(y), r2=95(width), r3=64(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 60
LDI r2, 95
LDI r3, 64
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
