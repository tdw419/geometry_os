; DESCRIPTION: Draws a cyan rectangle at (141, 132) with width 51 and height 30.
; PLAN: r0=141(x), r1=132(y), r2=51(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 132
LDI r2, 51
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
