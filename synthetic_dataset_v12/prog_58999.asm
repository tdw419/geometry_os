; DESCRIPTION: Renders a cyan line between points (177, 238) and (208, 200).
; PLAN: r0=177(x1), r1=238(y1), r2=208(x2), r3=200(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 238
LDI r2, 208
LDI r3, 200
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
