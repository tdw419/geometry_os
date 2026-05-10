; DESCRIPTION: Renders a yellow box of size 105x116 starting at (162, 27).
; PLAN: r0=162(x), r1=27(y), r2=105(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 27
LDI r2, 105
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
