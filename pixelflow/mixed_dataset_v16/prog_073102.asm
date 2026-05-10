; DESCRIPTION: Renders a red line between points (31, 59) and (272, 177).
; PLAN: r0=31(x1), r1=59(y1), r2=272(x2), r3=177(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 59
LDI r2, 272
LDI r3, 177
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
