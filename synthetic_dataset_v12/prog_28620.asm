; DESCRIPTION: Renders a cyan line between points (448, 120) and (21, 51).
; PLAN: r0=448(x1), r1=120(y1), r2=21(x2), r3=51(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 120
LDI r2, 21
LDI r3, 51
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
