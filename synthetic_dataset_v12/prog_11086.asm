; DESCRIPTION: Draws a green line from (371, 81) to (423, 73).
; PLAN: r0=371(x1), r1=81(y1), r2=423(x2), r3=73(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 371
LDI r1, 81
LDI r2, 423
LDI r3, 73
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
