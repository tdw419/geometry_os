; DESCRIPTION: Draws a cyan rectangle at (30, 162) with width 11 and height 54.
; PLAN: r0=30(x), r1=162(y), r2=11(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 162
LDI r2, 11
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
