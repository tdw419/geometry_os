; DESCRIPTION: Draws a cyan line from (249, 131) to (95, 179).
; PLAN: r0=249(x1), r1=131(y1), r2=95(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 249
LDI r1, 131
LDI r2, 95
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
