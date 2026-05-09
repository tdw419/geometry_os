; DESCRIPTION: Draws a cyan line from (135, 254) to (448, 217).
; PLAN: r0=135(x1), r1=254(y1), r2=448(x2), r3=217(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 254
LDI r2, 448
LDI r3, 217
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
