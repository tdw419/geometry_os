; DESCRIPTION: Places a cyan line segment connecting (132, 54) to (10, 211).
; PLAN: r0=132(x1), r1=54(y1), r2=10(x2), r3=211(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 54
LDI r2, 10
LDI r3, 211
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
