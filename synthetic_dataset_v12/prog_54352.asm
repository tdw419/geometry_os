; DESCRIPTION: Renders a yellow box of size 74x116 starting at (4, 12).
; PLAN: r0=4(x), r1=12(y), r2=74(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 12
LDI r2, 74
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
