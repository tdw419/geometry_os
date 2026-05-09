; DESCRIPTION: Renders a cyan line between points (102, 46) and (124, 83).
; PLAN: r0=102(x1), r1=46(y1), r2=124(x2), r3=83(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 46
LDI r2, 124
LDI r3, 83
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
