; DESCRIPTION: Renders a red box of size 17x61 starting at (2, 161).
; PLAN: r0=2(x), r1=161(y), r2=17(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 2
LDI r1, 161
LDI r2, 17
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
