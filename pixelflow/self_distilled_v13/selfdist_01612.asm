; DESCRIPTION: Draws a cyan rectangle at (209, 43) with width 84 and height 65.
; PLAN: r0=209(x), r1=43(y), r2=84(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 43
LDI r2, 84
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
