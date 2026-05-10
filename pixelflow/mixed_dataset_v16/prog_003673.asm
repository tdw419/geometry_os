; DESCRIPTION: Draws a cyan rectangle at (269, 78) with width 17 and height 11.
; PLAN: r0=269(x), r1=78(y), r2=17(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 78
LDI r2, 17
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
