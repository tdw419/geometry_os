; DESCRIPTION: Renders a cyan line between points (46, 133) and (118, 73).
; PLAN: r0=46(x1), r1=133(y1), r2=118(x2), r3=73(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 133
LDI r2, 118
LDI r3, 73
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
