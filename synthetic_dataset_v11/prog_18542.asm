; DESCRIPTION: Draws a cyan rectangle at (88, 5) with width 112 and height 60.
; PLAN: r0=88(x), r1=5(y), r2=112(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 88
LDI r1, 5
LDI r2, 112
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
