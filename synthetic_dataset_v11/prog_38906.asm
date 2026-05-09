; DESCRIPTION: Places a green line segment connecting (164, 223) to (132, 6).
; PLAN: r0=164(x1), r1=223(y1), r2=132(x2), r3=6(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 223
LDI r2, 132
LDI r3, 6
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
