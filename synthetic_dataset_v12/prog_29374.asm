; DESCRIPTION: Draws a black rectangle at (328, 64) with width 45 and height 100.
; PLAN: r0=328(x), r1=64(y), r2=45(width), r3=100(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 64
LDI r2, 45
LDI r3, 100
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
