; DESCRIPTION: Renders a yellow line between points (103, 80) and (469, 210).
; PLAN: r0=103(x1), r1=80(y1), r2=469(x2), r3=210(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 80
LDI r2, 469
LDI r3, 210
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
