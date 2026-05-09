; DESCRIPTION: Renders a white box of size 55x33 starting at (124, 31).
; PLAN: r0=124(x), r1=31(y), r2=55(width), r3=33(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 31
LDI r2, 55
LDI r3, 33
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
