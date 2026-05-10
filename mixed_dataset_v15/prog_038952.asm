; DESCRIPTION: Draws a cyan rectangle at (105, 35) with width 98 and height 54.
; PLAN: r0=105(x), r1=35(y), r2=98(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 35
LDI r2, 98
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
