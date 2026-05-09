; DESCRIPTION: Renders a red box of size 96x19 starting at (80, 109).
; PLAN: r0=80(x), r1=109(y), r2=96(width), r3=19(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 109
LDI r2, 96
LDI r3, 19
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
