; DESCRIPTION: Places a green line segment connecting (51, 232) to (236, 154).
; PLAN: r0=51(x1), r1=232(y1), r2=236(x2), r3=154(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 232
LDI r2, 236
LDI r3, 154
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
