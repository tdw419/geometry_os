; DESCRIPTION: Draws a cyan line from (87, 211) to (159, 157).
; PLAN: r0=87(x1), r1=211(y1), r2=159(x2), r3=157(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 211
LDI r2, 159
LDI r3, 157
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
