; DESCRIPTION: Renders a cyan line between points (221, 122) and (6, 124).
; PLAN: r0=221(x1), r1=122(y1), r2=6(x2), r3=124(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 122
LDI r2, 6
LDI r3, 124
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
