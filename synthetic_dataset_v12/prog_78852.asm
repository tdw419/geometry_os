; DESCRIPTION: Renders a blue line between points (117, 205) and (93, 195).
; PLAN: r0=117(x1), r1=205(y1), r2=93(x2), r3=195(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 205
LDI r2, 93
LDI r3, 195
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
