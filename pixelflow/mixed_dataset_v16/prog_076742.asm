; DESCRIPTION: Draws a cyan rectangle at (199, 77) with width 10 and height 116.
; PLAN: r0=199(x), r1=77(y), r2=10(width), r3=116(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 77
LDI r2, 10
LDI r3, 116
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
