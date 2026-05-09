; DESCRIPTION: Renders a cyan line between points (164, 87) and (92, 80).
; PLAN: r0=164(x1), r1=87(y1), r2=92(x2), r3=80(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 87
LDI r2, 92
LDI r3, 80
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
