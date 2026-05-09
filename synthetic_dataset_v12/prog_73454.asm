; DESCRIPTION: Places a white line segment connecting (385, 168) to (259, 132).
; PLAN: r0=385(x1), r1=168(y1), r2=259(x2), r3=132(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 168
LDI r2, 259
LDI r3, 132
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
