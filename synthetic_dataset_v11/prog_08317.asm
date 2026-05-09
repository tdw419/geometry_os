; DESCRIPTION: Draws a yellow line from (75, 24) to (143, 231).
; PLAN: r0=75(x1), r1=24(y1), r2=143(x2), r3=231(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 24
LDI r2, 143
LDI r3, 231
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
