; DESCRIPTION: Draws a yellow rectangle at (215, 64) with width 53 and height 76.
; PLAN: r0=215(x), r1=64(y), r2=53(width), r3=76(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 64
LDI r2, 53
LDI r3, 76
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
