; DESCRIPTION: Renders a white box of size 35x88 starting at (135, 131).
; PLAN: r0=135(x), r1=131(y), r2=35(width), r3=88(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 131
LDI r2, 35
LDI r3, 88
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
