; DESCRIPTION: Renders a yellow box of size 28x47 starting at (35, 162).
; PLAN: r0=35(x), r1=162(y), r2=28(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 162
LDI r2, 28
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
