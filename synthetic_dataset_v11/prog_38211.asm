; DESCRIPTION: Draws a green line from (18, 48) to (35, 119).
; PLAN: r0=18(x1), r1=48(y1), r2=35(x2), r3=119(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 48
LDI r2, 35
LDI r3, 119
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
