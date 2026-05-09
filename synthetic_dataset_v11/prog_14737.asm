; DESCRIPTION: Renders a cyan line between points (141, 216) and (135, 191).
; PLAN: r0=141(x1), r1=216(y1), r2=135(x2), r3=191(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 216
LDI r2, 135
LDI r3, 191
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
