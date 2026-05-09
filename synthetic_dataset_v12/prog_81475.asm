; DESCRIPTION: Renders a yellow box of size 72x116 starting at (110, 136).
; PLAN: r0=110(x), r1=136(y), r2=72(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 136
LDI r2, 72
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
