; DESCRIPTION: Draws a cyan rectangle at (131, 72) with width 19 and height 34.
; PLAN: r0=131(x), r1=72(y), r2=19(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 72
LDI r2, 19
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
