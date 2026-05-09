; DESCRIPTION: Draws a cyan rectangle at (51, 68) with width 21 and height 43.
; PLAN: r0=51(x), r1=68(y), r2=21(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 68
LDI r2, 21
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
