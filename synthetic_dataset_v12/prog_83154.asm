; DESCRIPTION: Renders a yellow box of size 116x38 starting at (240, 80).
; PLAN: r0=240(x), r1=80(y), r2=116(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 80
LDI r2, 116
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
