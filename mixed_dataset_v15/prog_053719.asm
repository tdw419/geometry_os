; DESCRIPTION: Renders a white box of size 100x55 starting at (244, 33).
; PLAN: r0=244(x), r1=33(y), r2=100(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 33
LDI r2, 100
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
