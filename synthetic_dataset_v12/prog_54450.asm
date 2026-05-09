; DESCRIPTION: Draws a cyan rectangle at (288, 72) with width 105 and height 73.
; PLAN: r0=288(x), r1=72(y), r2=105(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 72
LDI r2, 105
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
