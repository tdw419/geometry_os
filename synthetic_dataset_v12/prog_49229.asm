; DESCRIPTION: Draws a black rectangle at (128, 131) with width 15 and height 120.
; PLAN: r0=128(x), r1=131(y), r2=15(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 131
LDI r2, 15
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
