; DESCRIPTION: Renders a yellow box of size 99x100 starting at (383, 153).
; PLAN: r0=383(x), r1=153(y), r2=99(width), r3=100(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 153
LDI r2, 99
LDI r3, 100
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
