; DESCRIPTION: Draws a white rectangle at (33, 162) with width 10 and height 66.
; PLAN: r0=33(x), r1=162(y), r2=10(width), r3=66(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 162
LDI r2, 10
LDI r3, 66
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
