; DESCRIPTION: Places a green line segment connecting (189, 103) to (73, 204).
; PLAN: r0=189(x1), r1=103(y1), r2=73(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 103
LDI r2, 73
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
