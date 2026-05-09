; DESCRIPTION: Draws a cyan rectangle at (87, 199) with width 17 and height 10.
; PLAN: r0=87(x), r1=199(y), r2=17(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 199
LDI r2, 17
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
