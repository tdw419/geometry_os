; DESCRIPTION: Draws a cyan line from (91, 201) to (35, 2).
; PLAN: r0=91(x1), r1=201(y1), r2=35(x2), r3=2(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 201
LDI r2, 35
LDI r3, 2
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
