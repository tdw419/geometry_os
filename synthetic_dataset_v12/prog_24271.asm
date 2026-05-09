; DESCRIPTION: Renders a green line between points (368, 58) and (334, 134).
; PLAN: r0=368(x1), r1=58(y1), r2=334(x2), r3=134(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 58
LDI r2, 334
LDI r3, 134
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
