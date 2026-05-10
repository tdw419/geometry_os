; DESCRIPTION: Renders a yellow box of size 27x99 starting at (162, 133).
; PLAN: r0=162(x), r1=133(y), r2=27(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 133
LDI r2, 27
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
