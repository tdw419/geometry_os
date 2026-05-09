; DESCRIPTION: Draws a white line from (413, 182) to (2, 48).
; PLAN: r0=413(x1), r1=182(y1), r2=2(x2), r3=48(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 413
LDI r1, 182
LDI r2, 2
LDI r3, 48
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
