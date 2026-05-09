; DESCRIPTION: Draws a cyan rectangle at (11, 74) with width 53 and height 116.
; PLAN: r0=11(x), r1=74(y), r2=53(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 74
LDI r2, 53
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
