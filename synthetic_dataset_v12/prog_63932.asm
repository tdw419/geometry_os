; DESCRIPTION: Renders a cyan line between points (135, 186) and (229, 85).
; PLAN: r0=135(x1), r1=186(y1), r2=229(x2), r3=85(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 186
LDI r2, 229
LDI r3, 85
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
