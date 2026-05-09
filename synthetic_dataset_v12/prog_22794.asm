; DESCRIPTION: Draws a cyan rectangle at (4, 212) with width 51 and height 21.
; PLAN: r0=4(x), r1=212(y), r2=51(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 212
LDI r2, 51
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
