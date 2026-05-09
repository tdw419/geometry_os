; DESCRIPTION: Renders a white box of size 26x73 starting at (154, 22).
; PLAN: r0=154(x), r1=22(y), r2=26(width), r3=73(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 154
LDI r1, 22
LDI r2, 26
LDI r3, 73
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
