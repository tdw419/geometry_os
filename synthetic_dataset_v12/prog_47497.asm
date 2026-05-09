; DESCRIPTION: Renders a cyan line between points (448, 90) and (419, 253).
; PLAN: r0=448(x1), r1=90(y1), r2=419(x2), r3=253(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 90
LDI r2, 419
LDI r3, 253
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
