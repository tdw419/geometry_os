; DESCRIPTION: Places a cyan line segment connecting (19, 11) to (132, 138).
; PLAN: r0=19(x1), r1=11(y1), r2=132(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 11
LDI r2, 132
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
