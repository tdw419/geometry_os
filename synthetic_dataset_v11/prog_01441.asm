; DESCRIPTION: Places a cyan line segment connecting (34, 211) to (52, 237).
; PLAN: r0=34(x1), r1=211(y1), r2=52(x2), r3=237(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 211
LDI r2, 52
LDI r3, 237
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
