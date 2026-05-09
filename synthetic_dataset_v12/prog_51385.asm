; DESCRIPTION: Renders a green line between points (491, 249) and (328, 23).
; PLAN: r0=491(x1), r1=249(y1), r2=328(x2), r3=23(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 491
LDI r1, 249
LDI r2, 328
LDI r3, 23
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
