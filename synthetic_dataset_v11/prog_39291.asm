; DESCRIPTION: Draws a green line from (99, 75) to (208, 219).
; PLAN: r0=99(x1), r1=75(y1), r2=208(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 75
LDI r2, 208
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
