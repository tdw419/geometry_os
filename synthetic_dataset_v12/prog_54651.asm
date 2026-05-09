; DESCRIPTION: Draws a cyan line from (363, 200) to (430, 87).
; PLAN: r0=363(x1), r1=200(y1), r2=430(x2), r3=87(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 363
LDI r1, 200
LDI r2, 430
LDI r3, 87
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
