; DESCRIPTION: Draws a green line from (120, 45) to (161, 48).
; PLAN: r0=120(x1), r1=45(y1), r2=161(x2), r3=48(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 45
LDI r2, 161
LDI r3, 48
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
