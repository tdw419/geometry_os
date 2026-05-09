; DESCRIPTION: Places a yellow line segment connecting (107, 109) to (502, 221).
; PLAN: r0=107(x1), r1=109(y1), r2=502(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 109
LDI r2, 502
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
