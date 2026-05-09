; DESCRIPTION: Places a cyan line segment connecting (471, 219) to (131, 16).
; PLAN: r0=471(x1), r1=219(y1), r2=131(x2), r3=16(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 219
LDI r2, 131
LDI r3, 16
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
