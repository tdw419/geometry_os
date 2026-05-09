; DESCRIPTION: Renders a red box of size 95x80 starting at (17, 55).
; PLAN: r0=17(x), r1=55(y), r2=95(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 17
LDI r1, 55
LDI r2, 95
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
