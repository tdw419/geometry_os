; DESCRIPTION: Renders a red line between points (202, 82) and (321, 160).
; PLAN: r0=202(x1), r1=82(y1), r2=321(x2), r3=160(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 82
LDI r2, 321
LDI r3, 160
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
