; DESCRIPTION: Renders a red box of size 38x51 starting at (438, 62).
; PLAN: r0=438(x), r1=62(y), r2=38(width), r3=51(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 62
LDI r2, 38
LDI r3, 51
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
