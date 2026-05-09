; DESCRIPTION: Renders a cyan line between points (221, 63) and (251, 45).
; PLAN: r0=221(x1), r1=63(y1), r2=251(x2), r3=45(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 63
LDI r2, 251
LDI r3, 45
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
