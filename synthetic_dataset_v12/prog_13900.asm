; DESCRIPTION: Renders a cyan line between points (477, 149) and (457, 220).
; PLAN: r0=477(x1), r1=149(y1), r2=457(x2), r3=220(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 149
LDI r2, 457
LDI r3, 220
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
