; DESCRIPTION: Draws a cyan rectangle at (385, 16) with width 105 and height 99.
; PLAN: r0=385(x), r1=16(y), r2=105(width), r3=99(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 16
LDI r2, 105
LDI r3, 99
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
