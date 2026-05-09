; DESCRIPTION: Renders a red box of size 119x32 starting at (138, 193).
; PLAN: r0=138(x), r1=193(y), r2=119(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 193
LDI r2, 119
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
