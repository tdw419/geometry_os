; DESCRIPTION: Renders a yellow box of size 80x89 starting at (61, 76).
; PLAN: r0=61(x), r1=76(y), r2=80(width), r3=89(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 76
LDI r2, 80
LDI r3, 89
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
