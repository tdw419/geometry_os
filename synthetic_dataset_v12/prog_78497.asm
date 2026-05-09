; DESCRIPTION: Draws a cyan line from (69, 106) to (453, 201).
; PLAN: r0=69(x1), r1=106(y1), r2=453(x2), r3=201(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 106
LDI r2, 453
LDI r3, 201
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
