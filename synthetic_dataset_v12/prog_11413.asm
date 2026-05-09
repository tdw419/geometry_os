; DESCRIPTION: Renders a yellow box of size 95x22 starting at (259, 6).
; PLAN: r0=259(x), r1=6(y), r2=95(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 6
LDI r2, 95
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
