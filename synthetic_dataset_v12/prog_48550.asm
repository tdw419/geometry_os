; DESCRIPTION: Places a cyan line segment connecting (219, 4) to (251, 12).
; PLAN: r0=219(x1), r1=4(y1), r2=251(x2), r3=12(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 219
LDI r1, 4
LDI r2, 251
LDI r3, 12
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
