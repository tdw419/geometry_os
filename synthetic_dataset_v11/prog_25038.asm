; DESCRIPTION: Renders a cyan line between points (89, 79) and (146, 138).
; PLAN: r0=89(x1), r1=79(y1), r2=146(x2), r3=138(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 79
LDI r2, 146
LDI r3, 138
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
