; DESCRIPTION: Draws a cyan line from (58, 97) to (448, 11).
; PLAN: r0=58(x1), r1=97(y1), r2=448(x2), r3=11(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 97
LDI r2, 448
LDI r3, 11
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
