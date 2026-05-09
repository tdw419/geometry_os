; DESCRIPTION: Renders a red box of size 10x35 starting at (40, 214).
; PLAN: r0=40(x), r1=214(y), r2=10(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 40
LDI r1, 214
LDI r2, 10
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
