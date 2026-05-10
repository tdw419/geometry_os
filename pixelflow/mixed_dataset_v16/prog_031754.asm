; DESCRIPTION: Draws a cyan rectangle at (111, 106) with width 108 and height 105.
; PLAN: r0=111(x), r1=106(y), r2=108(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 106
LDI r2, 108
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
