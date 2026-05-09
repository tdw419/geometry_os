; DESCRIPTION: Draws a cyan line from (29, 229) to (448, 33).
; PLAN: r0=29(x1), r1=229(y1), r2=448(x2), r3=33(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 229
LDI r2, 448
LDI r3, 33
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
