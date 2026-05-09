; DESCRIPTION: Draws a green line from (448, 233) to (64, 21).
; PLAN: r0=448(x1), r1=233(y1), r2=64(x2), r3=21(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 233
LDI r2, 64
LDI r3, 21
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
