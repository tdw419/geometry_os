; DESCRIPTION: Draws a cyan rectangle at (59, 105) with width 105 and height 22.
; PLAN: r0=59(x), r1=105(y), r2=105(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 105
LDI r2, 105
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
