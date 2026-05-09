; DESCRIPTION: Renders a red box of size 113x55 starting at (89, 137).
; PLAN: r0=89(x), r1=137(y), r2=113(width), r3=55(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 137
LDI r2, 113
LDI r3, 55
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
