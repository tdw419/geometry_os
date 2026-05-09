; DESCRIPTION: Renders a cyan line between points (201, 197) and (118, 37).
; PLAN: r0=201(x1), r1=197(y1), r2=118(x2), r3=37(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 197
LDI r2, 118
LDI r3, 37
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
