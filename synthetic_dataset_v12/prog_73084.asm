; DESCRIPTION: Renders a red box of size 68x119 starting at (104, 25).
; PLAN: r0=104(x), r1=25(y), r2=68(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 25
LDI r2, 68
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
