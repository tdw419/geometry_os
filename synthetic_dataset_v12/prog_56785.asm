; DESCRIPTION: Draws a cyan line from (87, 169) to (92, 186).
; PLAN: r0=87(x1), r1=169(y1), r2=92(x2), r3=186(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 169
LDI r2, 92
LDI r3, 186
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
