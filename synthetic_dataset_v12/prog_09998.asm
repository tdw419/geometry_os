; DESCRIPTION: Draws a blue rectangle at (401, 22) with width 44 and height 22.
; PLAN: r0=401(x), r1=22(y), r2=44(width), r3=22(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 401
LDI r1, 22
LDI r2, 44
LDI r3, 22
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
