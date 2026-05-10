; DESCRIPTION: Renders a cyan line between points (389, 108) and (29, 139).
; PLAN: r0=389(x1), r1=108(y1), r2=29(x2), r3=139(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 108
LDI r2, 29
LDI r3, 139
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
