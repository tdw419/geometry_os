; DESCRIPTION: Draws a cyan rectangle at (51, 93) with width 92 and height 36.
; PLAN: r0=51(x), r1=93(y), r2=92(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 93
LDI r2, 92
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
