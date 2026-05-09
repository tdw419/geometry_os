; DESCRIPTION: Draws a green line from (23, 66) to (360, 51).
; PLAN: r0=23(x1), r1=66(y1), r2=360(x2), r3=51(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 23
LDI r1, 66
LDI r2, 360
LDI r3, 51
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
