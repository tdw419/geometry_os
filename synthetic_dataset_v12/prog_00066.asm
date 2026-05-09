; DESCRIPTION: Renders a cyan line between points (73, 71) and (161, 59).
; PLAN: r0=73(x1), r1=71(y1), r2=161(x2), r3=59(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 71
LDI r2, 161
LDI r3, 59
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
