; DESCRIPTION: Draws a cyan line from (94, 200) to (369, 195).
; PLAN: r0=94(x1), r1=200(y1), r2=369(x2), r3=195(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 200
LDI r2, 369
LDI r3, 195
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
