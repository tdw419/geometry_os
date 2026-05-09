; DESCRIPTION: Renders a red box of size 11x79 starting at (226, 124).
; PLAN: r0=226(x), r1=124(y), r2=11(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 124
LDI r2, 11
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
