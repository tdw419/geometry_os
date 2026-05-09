; DESCRIPTION: Draws a cyan line from (95, 87) to (144, 179).
; PLAN: r0=95(x1), r1=87(y1), r2=144(x2), r3=179(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 87
LDI r2, 144
LDI r3, 179
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
