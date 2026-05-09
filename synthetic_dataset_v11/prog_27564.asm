; DESCRIPTION: Places a cyan line segment connecting (131, 252) to (24, 208).
; PLAN: r0=131(x1), r1=252(y1), r2=24(x2), r3=208(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 252
LDI r2, 24
LDI r3, 208
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
