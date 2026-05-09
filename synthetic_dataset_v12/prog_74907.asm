; DESCRIPTION: Draws a cyan line from (330, 201) to (93, 11).
; PLAN: r0=330(x1), r1=201(y1), r2=93(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 201
LDI r2, 93
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
