; DESCRIPTION: Draws a cyan line from (259, 101) to (229, 93).
; PLAN: r0=259(x1), r1=101(y1), r2=229(x2), r3=93(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 101
LDI r2, 229
LDI r3, 93
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
