; DESCRIPTION: Places a green line segment connecting (189, 254) to (161, 182).
; PLAN: r0=189(x1), r1=254(y1), r2=161(x2), r3=182(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 254
LDI r2, 161
LDI r3, 182
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
