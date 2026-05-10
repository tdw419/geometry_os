; DESCRIPTION: Renders a yellow box of size 22x116 starting at (178, 35).
; PLAN: r0=178(x), r1=35(y), r2=22(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 35
LDI r2, 22
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
