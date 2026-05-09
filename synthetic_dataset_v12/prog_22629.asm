; DESCRIPTION: Renders a cyan line between points (293, 75) and (328, 96).
; PLAN: r0=293(x1), r1=75(y1), r2=328(x2), r3=96(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 75
LDI r2, 328
LDI r3, 96
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
