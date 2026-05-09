; DESCRIPTION: Draws a cyan line from (110, 99) to (300, 246).
; PLAN: r0=110(x1), r1=99(y1), r2=300(x2), r3=246(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 99
LDI r2, 300
LDI r3, 246
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
