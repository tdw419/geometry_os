; DESCRIPTION: Draws a cyan rectangle at (226, 51) with width 73 and height 68.
; PLAN: r0=226(x), r1=51(y), r2=73(width), r3=68(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 51
LDI r2, 73
LDI r3, 68
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
