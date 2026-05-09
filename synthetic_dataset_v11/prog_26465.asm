; DESCRIPTION: Draws a cyan rectangle at (87, 95) with width 114 and height 17.
; PLAN: r0=87(x), r1=95(y), r2=114(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 95
LDI r2, 114
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
