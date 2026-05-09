; DESCRIPTION: Renders a red box of size 12x76 starting at (109, 169).
; PLAN: r0=109(x), r1=169(y), r2=12(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 169
LDI r2, 12
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
