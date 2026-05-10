; DESCRIPTION: Draws a cyan rectangle at (192, 164) with width 90 and height 17.
; PLAN: r0=192(x), r1=164(y), r2=90(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 164
LDI r2, 90
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
