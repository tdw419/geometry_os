; DESCRIPTION: Places a green line segment connecting (182, 58) to (328, 51).
; PLAN: r0=182(x1), r1=58(y1), r2=328(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 58
LDI r2, 328
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
