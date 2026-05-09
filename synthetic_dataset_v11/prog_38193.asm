; DESCRIPTION: Renders a cyan line between points (145, 245) and (185, 0).
; PLAN: r0=145(x1), r1=245(y1), r2=185(x2), r3=0(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 145
LDI r1, 245
LDI r2, 185
LDI r3, 0
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
