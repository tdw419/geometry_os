; DESCRIPTION: Draws a cyan line from (186, 102) to (179, 44).
; PLAN: r0=186(x1), r1=102(y1), r2=179(x2), r3=44(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 186
LDI r1, 102
LDI r2, 179
LDI r3, 44
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
