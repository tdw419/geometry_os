; DESCRIPTION: Renders a cyan line between points (177, 236) and (278, 94).
; PLAN: r0=177(x1), r1=236(y1), r2=278(x2), r3=94(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 236
LDI r2, 278
LDI r3, 94
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
