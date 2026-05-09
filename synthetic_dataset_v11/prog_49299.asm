; DESCRIPTION: Draws a cyan line from (177, 75) to (237, 206).
; PLAN: r0=177(x1), r1=75(y1), r2=237(x2), r3=206(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 75
LDI r2, 237
LDI r3, 206
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
