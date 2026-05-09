; DESCRIPTION: Renders a green line between points (364, 58) and (322, 195).
; PLAN: r0=364(x1), r1=58(y1), r2=322(x2), r3=195(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 364
LDI r1, 58
LDI r2, 322
LDI r3, 195
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
