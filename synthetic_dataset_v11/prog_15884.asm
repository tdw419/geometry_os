; DESCRIPTION: Draws a cyan rectangle at (33, 162) with width 77 and height 66.
; PLAN: r0=33(x), r1=162(y), r2=77(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 162
LDI r2, 77
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
