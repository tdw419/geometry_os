; DESCRIPTION: Renders a red box of size 119x21 starting at (254, 137).
; PLAN: r0=254(x), r1=137(y), r2=119(width), r3=21(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 137
LDI r2, 119
LDI r3, 21
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
