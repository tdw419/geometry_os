; DESCRIPTION: Draws a green rectangle at (249, 8) with width 27 and height 30.
; PLAN: r0=249(x), r1=8(y), r2=27(width), r3=30(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 8
LDI r2, 27
LDI r3, 30
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
