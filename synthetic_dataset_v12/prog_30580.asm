; DESCRIPTION: Draws a white rectangle at (401, 162) with width 29 and height 73.
; PLAN: r0=401(x), r1=162(y), r2=29(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 162
LDI r2, 29
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
