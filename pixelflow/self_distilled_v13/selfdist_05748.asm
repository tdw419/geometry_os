; DESCRIPTION: Draws a cyan rectangle at (220, 49) with width 17 and height 89.
; PLAN: r0=220(x), r1=49(y), r2=17(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 220
LDI r1, 49
LDI r2, 17
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
