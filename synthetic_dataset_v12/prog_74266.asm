; DESCRIPTION: Renders a green line between points (275, 182) and (469, 34).
; PLAN: r0=275(x1), r1=182(y1), r2=469(x2), r3=34(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 182
LDI r2, 469
LDI r3, 34
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
