; DESCRIPTION: Places a cyan line segment connecting (145, 64) to (99, 181).
; PLAN: r0=145(x1), r1=64(y1), r2=99(x2), r3=181(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 64
LDI r2, 99
LDI r3, 181
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
