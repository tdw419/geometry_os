; DESCRIPTION: Renders a red box of size 55x33 starting at (172, 2).
; PLAN: r0=172(x), r1=2(y), r2=55(width), r3=33(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 2
LDI r2, 55
LDI r3, 33
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
