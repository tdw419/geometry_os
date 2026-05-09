; DESCRIPTION: Renders a red line between points (112, 157) and (405, 173).
; PLAN: r0=112(x1), r1=157(y1), r2=405(x2), r3=173(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 157
LDI r2, 405
LDI r3, 173
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
