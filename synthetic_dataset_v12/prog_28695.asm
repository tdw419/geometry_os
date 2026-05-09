; DESCRIPTION: Draws a cyan rectangle at (51, 136) with width 24 and height 72.
; PLAN: r0=51(x), r1=136(y), r2=24(width), r3=72(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 136
LDI r2, 24
LDI r3, 72
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
