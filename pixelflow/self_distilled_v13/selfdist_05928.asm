; DESCRIPTION: Draws a cyan line from (229, 118) to (321, 101).
; PLAN: r0=229(x1), r1=118(y1), r2=321(x2), r3=101(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 118
LDI r2, 321
LDI r3, 101
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
