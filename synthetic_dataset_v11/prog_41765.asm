; DESCRIPTION: Draws a cyan line from (114, 201) to (100, 204).
; PLAN: r0=114(x1), r1=201(y1), r2=100(x2), r3=204(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 201
LDI r2, 100
LDI r3, 204
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
