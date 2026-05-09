; DESCRIPTION: Renders a red box of size 105x20 starting at (133, 46).
; PLAN: r0=133(x), r1=46(y), r2=105(width), r3=20(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 46
LDI r2, 105
LDI r3, 20
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
