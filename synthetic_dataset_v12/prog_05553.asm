; DESCRIPTION: Renders a yellow box of size 22x99 starting at (189, 5).
; PLAN: r0=189(x), r1=5(y), r2=22(width), r3=99(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 5
LDI r2, 22
LDI r3, 99
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
