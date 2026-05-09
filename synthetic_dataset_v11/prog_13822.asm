; DESCRIPTION: Places a cyan line segment connecting (219, 7) to (184, 58).
; PLAN: r0=219(x1), r1=7(y1), r2=184(x2), r3=58(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 7
LDI r2, 184
LDI r3, 58
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
