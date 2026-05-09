; DESCRIPTION: Places a cyan line segment connecting (211, 64) to (37, 194).
; PLAN: r0=211(x1), r1=64(y1), r2=37(x2), r3=194(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 64
LDI r2, 37
LDI r3, 194
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
