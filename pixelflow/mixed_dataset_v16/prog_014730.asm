; DESCRIPTION: Renders a cyan line between points (261, 201) and (337, 196).
; PLAN: r0=261(x1), r1=201(y1), r2=337(x2), r3=196(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 201
LDI r2, 337
LDI r3, 196
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
