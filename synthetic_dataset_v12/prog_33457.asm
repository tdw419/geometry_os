; DESCRIPTION: Places a cyan line segment connecting (503, 137) to (453, 45).
; PLAN: r0=503(x1), r1=137(y1), r2=453(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 503
LDI r1, 137
LDI r2, 453
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
