; DESCRIPTION: Draws a white line from (193, 182) to (368, 0).
; PLAN: r0=193(x1), r1=182(y1), r2=368(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 182
LDI r2, 368
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
