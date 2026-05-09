; DESCRIPTION: Draws a cyan line from (490, 201) to (264, 127).
; PLAN: r0=490(x1), r1=201(y1), r2=264(x2), r3=127(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 201
LDI r2, 264
LDI r3, 127
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
