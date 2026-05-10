; DESCRIPTION: Draws a cyan rectangle at (332, 119) with width 119 and height 113.
; PLAN: r0=332(x), r1=119(y), r2=119(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 119
LDI r2, 119
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
