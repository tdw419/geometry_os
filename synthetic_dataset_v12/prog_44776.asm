; DESCRIPTION: Places a cyan line segment connecting (365, 112) to (107, 123).
; PLAN: r0=365(x1), r1=112(y1), r2=107(x2), r3=123(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 365
LDI r1, 112
LDI r2, 107
LDI r3, 123
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
