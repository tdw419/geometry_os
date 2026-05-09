; DESCRIPTION: Renders a yellow box of size 119x116 starting at (32, 39).
; PLAN: r0=32(x), r1=39(y), r2=119(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 39
LDI r2, 119
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
