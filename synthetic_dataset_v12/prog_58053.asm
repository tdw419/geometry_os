; DESCRIPTION: Renders a green line between points (193, 58) and (329, 165).
; PLAN: r0=193(x1), r1=58(y1), r2=329(x2), r3=165(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 58
LDI r2, 329
LDI r3, 165
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
