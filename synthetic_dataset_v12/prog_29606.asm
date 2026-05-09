; DESCRIPTION: Renders a black box of size 89x80 starting at (229, 138).
; PLAN: r0=229(x), r1=138(y), r2=89(width), r3=80(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 138
LDI r2, 89
LDI r3, 80
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
