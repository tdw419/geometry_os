; DESCRIPTION: Places a cyan line segment connecting (37, 174) to (189, 142).
; PLAN: r0=37(x1), r1=174(y1), r2=189(x2), r3=142(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 174
LDI r2, 189
LDI r3, 142
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
