; DESCRIPTION: Draws a cyan line from (22, 187) to (448, 203).
; PLAN: r0=22(x1), r1=187(y1), r2=448(x2), r3=203(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 187
LDI r2, 448
LDI r3, 203
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
