; DESCRIPTION: Renders a cyan line between points (466, 141) and (11, 59).
; PLAN: r0=466(x1), r1=141(y1), r2=11(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 141
LDI r2, 11
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
