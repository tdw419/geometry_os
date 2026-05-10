; DESCRIPTION: Draws a cyan rectangle at (288, 174) with width 73 and height 49.
; PLAN: r0=288(x), r1=174(y), r2=73(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 174
LDI r2, 73
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
