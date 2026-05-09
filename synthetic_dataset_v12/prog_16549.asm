; DESCRIPTION: Places a cyan line segment connecting (347, 206) to (61, 112).
; PLAN: r0=347(x1), r1=206(y1), r2=61(x2), r3=112(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 347
LDI r1, 206
LDI r2, 61
LDI r3, 112
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
