; DESCRIPTION: Places a cyan line segment connecting (64, 55) to (56, 77).
; PLAN: r0=64(x1), r1=55(y1), r2=56(x2), r3=77(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 55
LDI r2, 56
LDI r3, 77
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
