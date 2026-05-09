; DESCRIPTION: Renders a yellow box of size 89x26 starting at (48, 185).
; PLAN: r0=48(x), r1=185(y), r2=89(width), r3=26(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 48
LDI r1, 185
LDI r2, 89
LDI r3, 26
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
