; DESCRIPTION: Places a cyan line segment connecting (19, 96) to (131, 2).
; PLAN: r0=19(x1), r1=96(y1), r2=131(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 96
LDI r2, 131
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
