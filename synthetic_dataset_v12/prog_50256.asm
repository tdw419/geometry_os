; DESCRIPTION: Draws a cyan rectangle at (385, 159) with width 108 and height 17.
; PLAN: r0=385(x), r1=159(y), r2=108(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 159
LDI r2, 108
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
