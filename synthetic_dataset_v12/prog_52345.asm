; DESCRIPTION: Renders a red line between points (189, 204) and (413, 127).
; PLAN: r0=189(x1), r1=204(y1), r2=413(x2), r3=127(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 189
LDI r1, 204
LDI r2, 413
LDI r3, 127
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
