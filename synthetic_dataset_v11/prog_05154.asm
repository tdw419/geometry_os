; DESCRIPTION: Draws a green line from (164, 145) to (123, 5).
; PLAN: r0=164(x1), r1=145(y1), r2=123(x2), r3=5(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 145
LDI r2, 123
LDI r3, 5
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
