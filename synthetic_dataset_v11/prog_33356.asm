; DESCRIPTION: Places a cyan line segment connecting (90, 64) to (81, 145).
; PLAN: r0=90(x1), r1=64(y1), r2=81(x2), r3=145(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 64
LDI r2, 81
LDI r3, 145
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
