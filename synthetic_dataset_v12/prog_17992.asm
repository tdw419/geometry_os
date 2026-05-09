; DESCRIPTION: Draws a cyan rectangle at (178, 69) with width 81 and height 15.
; PLAN: r0=178(x), r1=69(y), r2=81(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 69
LDI r2, 81
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
