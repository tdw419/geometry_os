; DESCRIPTION: Renders a yellow box of size 37x46 starting at (149, 77).
; PLAN: r0=149(x), r1=77(y), r2=37(width), r3=46(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 77
LDI r2, 37
LDI r3, 46
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
