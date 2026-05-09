; DESCRIPTION: Renders a cyan line between points (463, 108) and (141, 14).
; PLAN: r0=463(x1), r1=108(y1), r2=141(x2), r3=14(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 463
LDI r1, 108
LDI r2, 141
LDI r3, 14
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
