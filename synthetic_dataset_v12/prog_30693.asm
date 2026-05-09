; DESCRIPTION: Draws a cyan rectangle at (11, 6) with width 108 and height 11.
; PLAN: r0=11(x), r1=6(y), r2=108(width), r3=11(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 6
LDI r2, 108
LDI r3, 11
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
