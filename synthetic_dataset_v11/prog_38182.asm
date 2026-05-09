; DESCRIPTION: Draws a cyan line from (26, 87) to (156, 54).
; PLAN: r0=26(x1), r1=87(y1), r2=156(x2), r3=54(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 87
LDI r2, 156
LDI r3, 54
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
