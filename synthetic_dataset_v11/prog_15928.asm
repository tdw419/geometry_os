; DESCRIPTION: Places a green line segment connecting (74, 249) to (83, 132).
; PLAN: r0=74(x1), r1=249(y1), r2=83(x2), r3=132(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 249
LDI r2, 83
LDI r3, 132
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
