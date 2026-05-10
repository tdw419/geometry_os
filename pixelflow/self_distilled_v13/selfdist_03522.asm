; DESCRIPTION: Draws a cyan line from (123, 102) to (323, 179).
; PLAN: r0=123(x1), r1=102(y1), r2=323(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 102
LDI r2, 323
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
