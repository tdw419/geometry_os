; DESCRIPTION: Renders a red line between points (182, 82) and (73, 237).
; PLAN: r0=182(x1), r1=82(y1), r2=73(x2), r3=237(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 82
LDI r2, 73
LDI r3, 237
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
