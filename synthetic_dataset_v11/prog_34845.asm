; DESCRIPTION: Places a cyan line segment connecting (4, 132) to (96, 77).
; PLAN: r0=4(x1), r1=132(y1), r2=96(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 132
LDI r2, 96
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
