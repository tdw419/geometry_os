; DESCRIPTION: Renders a cyan line between points (477, 162) and (447, 250).
; PLAN: r0=477(x1), r1=162(y1), r2=447(x2), r3=250(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 477
LDI r1, 162
LDI r2, 447
LDI r3, 250
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
