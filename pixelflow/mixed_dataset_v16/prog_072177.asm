; DESCRIPTION: Places a green line segment connecting (403, 186) to (204, 89).
; PLAN: r0=403(x1), r1=186(y1), r2=204(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 186
LDI r2, 204
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
