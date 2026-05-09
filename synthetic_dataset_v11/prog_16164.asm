; DESCRIPTION: Renders a red box of size 49x31 starting at (149, 160).
; PLAN: r0=149(x), r1=160(y), r2=49(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 160
LDI r2, 49
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
