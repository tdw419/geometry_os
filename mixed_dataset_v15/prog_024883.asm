; DESCRIPTION: Renders a white line between points (259, 187) and (412, 112).
; PLAN: r0=259(x1), r1=187(y1), r2=412(x2), r3=112(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 187
LDI r2, 412
LDI r3, 112
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
