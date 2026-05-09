; DESCRIPTION: Draws a cyan rectangle at (11, 60) with width 47 and height 51.
; PLAN: r0=11(x), r1=60(y), r2=47(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 60
LDI r2, 47
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
