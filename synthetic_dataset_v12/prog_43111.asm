; DESCRIPTION: Draws a cyan rectangle at (114, 147) with width 33 and height 57.
; PLAN: r0=114(x), r1=147(y), r2=33(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 147
LDI r2, 33
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
