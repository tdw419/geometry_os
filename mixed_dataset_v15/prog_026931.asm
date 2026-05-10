; DESCRIPTION: Renders a yellow box of size 35x20 starting at (474, 75).
; PLAN: r0=474(x), r1=75(y), r2=35(width), r3=20(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 474
LDI r1, 75
LDI r2, 35
LDI r3, 20
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
