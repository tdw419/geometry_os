; DESCRIPTION: Places a green line segment connecting (331, 221) to (283, 89).
; PLAN: r0=331(x1), r1=221(y1), r2=283(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 221
LDI r2, 283
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
