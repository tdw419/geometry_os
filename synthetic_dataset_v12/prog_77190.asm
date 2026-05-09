; DESCRIPTION: Draws a cyan rectangle at (463, 17) with width 40 and height 90.
; PLAN: r0=463(x), r1=17(y), r2=40(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 17
LDI r2, 40
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
