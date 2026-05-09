; DESCRIPTION: Renders a green line between points (98, 182) and (131, 56).
; PLAN: r0=98(x1), r1=182(y1), r2=131(x2), r3=56(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 182
LDI r2, 131
LDI r3, 56
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
