; DESCRIPTION: Places a green line segment connecting (204, 50) to (187, 189).
; PLAN: r0=204(x1), r1=50(y1), r2=187(x2), r3=189(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 50
LDI r2, 187
LDI r3, 189
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
