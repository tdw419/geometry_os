; DESCRIPTION: Places a green line segment connecting (411, 58) to (182, 91).
; PLAN: r0=411(x1), r1=58(y1), r2=182(x2), r3=91(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 58
LDI r2, 182
LDI r3, 91
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
