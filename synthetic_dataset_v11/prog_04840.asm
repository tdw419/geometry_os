; DESCRIPTION: Draws a cyan line from (54, 169) to (156, 126).
; PLAN: r0=54(x1), r1=169(y1), r2=156(x2), r3=126(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 169
LDI r2, 156
LDI r3, 126
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
