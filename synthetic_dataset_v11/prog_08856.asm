; DESCRIPTION: Draws a cyan rectangle at (189, 136) with width 33 and height 49.
; PLAN: r0=189(x), r1=136(y), r2=33(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 136
LDI r2, 33
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
