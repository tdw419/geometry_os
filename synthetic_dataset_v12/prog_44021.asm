; DESCRIPTION: Places a cyan line segment connecting (25, 137) to (27, 89).
; PLAN: r0=25(x1), r1=137(y1), r2=27(x2), r3=89(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 137
LDI r2, 27
LDI r3, 89
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
