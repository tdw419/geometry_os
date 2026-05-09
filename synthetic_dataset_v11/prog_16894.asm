; DESCRIPTION: Draws a cyan rectangle at (178, 11) with width 48 and height 88.
; PLAN: r0=178(x), r1=11(y), r2=48(width), r3=88(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 11
LDI r2, 48
LDI r3, 88
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
