; DESCRIPTION: Draws a cyan rectangle at (135, 45) with width 51 and height 89.
; PLAN: r0=135(x), r1=45(y), r2=51(width), r3=89(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 45
LDI r2, 51
LDI r3, 89
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
