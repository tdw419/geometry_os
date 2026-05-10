; DESCRIPTION: Renders a yellow box of size 11x102 starting at (416, 73).
; PLAN: r0=416(x), r1=73(y), r2=11(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 73
LDI r2, 11
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
