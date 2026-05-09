; DESCRIPTION: Draws a cyan rectangle at (65, 127) with width 51 and height 118.
; PLAN: r0=65(x), r1=127(y), r2=51(width), r3=118(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 65
LDI r1, 127
LDI r2, 51
LDI r3, 118
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
