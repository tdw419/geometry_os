; DESCRIPTION: Draws a red line from (16, 212) to (272, 193).
; PLAN: r0=16(x1), r1=212(y1), r2=272(x2), r3=193(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 212
LDI r2, 272
LDI r3, 193
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
