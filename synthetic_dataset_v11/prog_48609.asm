; DESCRIPTION: Places a cyan line segment connecting (131, 76) to (61, 196).
; PLAN: r0=131(x1), r1=76(y1), r2=61(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 76
LDI r2, 61
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
