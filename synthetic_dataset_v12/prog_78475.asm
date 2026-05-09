; DESCRIPTION: Renders a red line between points (221, 236) and (268, 204).
; PLAN: r0=221(x1), r1=236(y1), r2=268(x2), r3=204(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 236
LDI r2, 268
LDI r3, 204
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
