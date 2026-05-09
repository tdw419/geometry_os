; DESCRIPTION: Draws a cyan rectangle at (51, 17) with width 114 and height 59.
; PLAN: r0=51(x), r1=17(y), r2=114(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 17
LDI r2, 114
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
