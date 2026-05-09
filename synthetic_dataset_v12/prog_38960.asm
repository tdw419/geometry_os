; DESCRIPTION: Renders a yellow box of size 91x77 starting at (31, 121).
; PLAN: r0=31(x), r1=121(y), r2=91(width), r3=77(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 121
LDI r2, 91
LDI r3, 77
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
