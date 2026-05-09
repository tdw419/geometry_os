; DESCRIPTION: Draws a cyan rectangle at (133, 48) with width 51 and height 79.
; PLAN: r0=133(x), r1=48(y), r2=51(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 48
LDI r2, 51
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
