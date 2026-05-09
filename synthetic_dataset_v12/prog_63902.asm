; DESCRIPTION: Places a yellow line segment connecting (171, 177) to (262, 208).
; PLAN: r0=171(x1), r1=177(y1), r2=262(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 177
LDI r2, 262
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
