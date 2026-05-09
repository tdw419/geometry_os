; DESCRIPTION: Renders a red box of size 34x57 starting at (79, 124).
; PLAN: r0=79(x), r1=124(y), r2=34(width), r3=57(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 124
LDI r2, 34
LDI r3, 57
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
