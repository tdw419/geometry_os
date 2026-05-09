; DESCRIPTION: Draws a cyan line from (87, 186) to (201, 99).
; PLAN: r0=87(x1), r1=186(y1), r2=201(x2), r3=99(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 186
LDI r2, 201
LDI r3, 99
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
