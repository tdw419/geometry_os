; DESCRIPTION: Places a cyan line segment connecting (185, 143) to (192, 193).
; PLAN: r0=185(x1), r1=143(y1), r2=192(x2), r3=193(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 143
LDI r2, 192
LDI r3, 193
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
