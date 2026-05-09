; DESCRIPTION: Renders a blue line between points (305, 245) and (492, 90).
; PLAN: r0=305(x1), r1=245(y1), r2=492(x2), r3=90(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 245
LDI r2, 492
LDI r3, 90
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
