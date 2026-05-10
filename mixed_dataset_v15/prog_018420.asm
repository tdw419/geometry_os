; DESCRIPTION: Places a cyan line segment connecting (491, 61) to (449, 92).
; PLAN: r0=491(x1), r1=61(y1), r2=449(x2), r3=92(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 61
LDI r2, 449
LDI r3, 92
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
