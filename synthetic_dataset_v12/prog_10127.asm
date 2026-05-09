; DESCRIPTION: Draws a cyan rectangle at (348, 167) with width 61 and height 38.
; PLAN: r0=348(x), r1=167(y), r2=61(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 348
LDI r1, 167
LDI r2, 61
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
