; DESCRIPTION: Places a cyan line segment connecting (73, 204) to (347, 69).
; PLAN: r0=73(x1), r1=204(y1), r2=347(x2), r3=69(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 204
LDI r2, 347
LDI r3, 69
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
