; DESCRIPTION: Renders a red box of size 77x33 starting at (66, 55).
; PLAN: r0=66(x), r1=55(y), r2=77(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 55
LDI r2, 77
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
