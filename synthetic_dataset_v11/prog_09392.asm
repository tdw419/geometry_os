; DESCRIPTION: Draws a cyan line from (198, 225) to (201, 52).
; PLAN: r0=198(x1), r1=225(y1), r2=201(x2), r3=52(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 225
LDI r2, 201
LDI r3, 52
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
