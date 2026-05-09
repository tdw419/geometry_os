; DESCRIPTION: Renders a cyan line between points (322, 77) and (102, 54).
; PLAN: r0=322(x1), r1=77(y1), r2=102(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 77
LDI r2, 102
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
