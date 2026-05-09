; DESCRIPTION: Renders a cyan line between points (120, 26) and (133, 36).
; PLAN: r0=120(x1), r1=26(y1), r2=133(x2), r3=36(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 26
LDI r2, 133
LDI r3, 36
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
