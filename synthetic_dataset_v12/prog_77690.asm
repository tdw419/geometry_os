; DESCRIPTION: Renders a red box of size 79x71 starting at (80, 182).
; PLAN: r0=80(x), r1=182(y), r2=79(width), r3=71(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 182
LDI r2, 79
LDI r3, 71
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
