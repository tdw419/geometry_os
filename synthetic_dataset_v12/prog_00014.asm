; DESCRIPTION: Places a cyan line segment connecting (192, 77) to (115, 242).
; PLAN: r0=192(x1), r1=77(y1), r2=115(x2), r3=242(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 192
LDI r1, 77
LDI r2, 115
LDI r3, 242
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
