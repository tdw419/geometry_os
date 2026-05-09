; DESCRIPTION: Renders a cyan line between points (161, 95) and (141, 51).
; PLAN: r0=161(x1), r1=95(y1), r2=141(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 95
LDI r2, 141
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
