; DESCRIPTION: Places a cyan line segment connecting (500, 186) to (358, 89).
; PLAN: r0=500(x1), r1=186(y1), r2=358(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 500
LDI r1, 186
LDI r2, 358
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
