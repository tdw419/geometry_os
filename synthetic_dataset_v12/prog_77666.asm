; DESCRIPTION: Draws a cyan rectangle at (373, 235) with width 51 and height 12.
; PLAN: r0=373(x), r1=235(y), r2=51(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 235
LDI r2, 51
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
