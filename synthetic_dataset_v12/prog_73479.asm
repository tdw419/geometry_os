; DESCRIPTION: Renders a cyan line between points (109, 12) and (145, 236).
; PLAN: r0=109(x1), r1=12(y1), r2=145(x2), r3=236(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 12
LDI r2, 145
LDI r3, 236
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
