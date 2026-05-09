; DESCRIPTION: Renders a blue line between points (182, 191) and (215, 139).
; PLAN: r0=182(x1), r1=191(y1), r2=215(x2), r3=139(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 191
LDI r2, 215
LDI r3, 139
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
