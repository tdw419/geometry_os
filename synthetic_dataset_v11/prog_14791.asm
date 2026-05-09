; DESCRIPTION: Renders a yellow box of size 77x26 starting at (34, 21).
; PLAN: r0=34(x), r1=21(y), r2=77(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 21
LDI r2, 77
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
