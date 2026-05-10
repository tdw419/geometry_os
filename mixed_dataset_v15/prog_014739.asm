; DESCRIPTION: Renders a yellow box of size 89x11 starting at (333, 145).
; PLAN: r0=333(x), r1=145(y), r2=89(width), r3=11(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 145
LDI r2, 89
LDI r3, 11
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
