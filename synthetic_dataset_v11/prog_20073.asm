; DESCRIPTION: Draws a cyan rectangle at (177, 116) with width 74 and height 78.
; PLAN: r0=177(x), r1=116(y), r2=74(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 116
LDI r2, 74
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
