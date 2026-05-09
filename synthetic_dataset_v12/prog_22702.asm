; DESCRIPTION: Draws a cyan rectangle at (196, 51) with width 75 and height 83.
; PLAN: r0=196(x), r1=51(y), r2=75(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 51
LDI r2, 75
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
