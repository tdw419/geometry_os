; DESCRIPTION: Renders a red box of size 46x46 starting at (423, 185).
; PLAN: r0=423(x), r1=185(y), r2=46(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 423
LDI r1, 185
LDI r2, 46
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
