; DESCRIPTION: Renders a green line between points (368, 36) and (469, 48).
; PLAN: r0=368(x1), r1=36(y1), r2=469(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 36
LDI r2, 469
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
