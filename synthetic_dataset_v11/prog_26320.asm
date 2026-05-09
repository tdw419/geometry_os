; DESCRIPTION: Renders a white box of size 10x83 starting at (124, 69).
; PLAN: r0=124(x), r1=69(y), r2=10(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 69
LDI r2, 10
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
