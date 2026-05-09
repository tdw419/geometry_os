; DESCRIPTION: Places a green line segment connecting (56, 221) to (65, 51).
; PLAN: r0=56(x1), r1=221(y1), r2=65(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 221
LDI r2, 65
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
