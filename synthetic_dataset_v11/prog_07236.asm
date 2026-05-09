; DESCRIPTION: Renders a red box of size 83x75 starting at (31, 124).
; PLAN: r0=31(x), r1=124(y), r2=83(width), r3=75(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 124
LDI r2, 83
LDI r3, 75
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
