; DESCRIPTION: Draws a black rectangle at (126, 131) with width 45 and height 16.
; PLAN: r0=126(x), r1=131(y), r2=45(width), r3=16(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 131
LDI r2, 45
LDI r3, 16
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
