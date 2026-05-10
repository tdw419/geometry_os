; DESCRIPTION: Draws a cyan rectangle at (159, 143) with width 81 and height 81.
; PLAN: r0=159(x), r1=143(y), r2=81(width), r3=81(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 143
LDI r2, 81
LDI r3, 81
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
