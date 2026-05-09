; DESCRIPTION: Renders a red box of size 51x58 starting at (259, 38).
; PLAN: r0=259(x), r1=38(y), r2=51(width), r3=58(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 38
LDI r2, 51
LDI r3, 58
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
