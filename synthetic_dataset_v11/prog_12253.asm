; DESCRIPTION: Places a green line segment connecting (174, 132) to (30, 48).
; PLAN: r0=174(x1), r1=132(y1), r2=30(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 132
LDI r2, 30
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
