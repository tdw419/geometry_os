; DESCRIPTION: Renders a cyan line between points (95, 123) and (193, 247).
; PLAN: r0=95(x1), r1=123(y1), r2=193(x2), r3=247(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 123
LDI r2, 193
LDI r3, 247
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
