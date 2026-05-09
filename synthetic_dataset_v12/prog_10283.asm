; DESCRIPTION: Places a cyan line segment connecting (357, 144) to (458, 142).
; PLAN: r0=357(x1), r1=144(y1), r2=458(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 357
LDI r1, 144
LDI r2, 458
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
