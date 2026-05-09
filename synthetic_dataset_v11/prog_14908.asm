; DESCRIPTION: Renders a red box of size 91x119 starting at (91, 12).
; PLAN: r0=91(x), r1=12(y), r2=91(width), r3=119(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 12
LDI r2, 91
LDI r3, 119
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
