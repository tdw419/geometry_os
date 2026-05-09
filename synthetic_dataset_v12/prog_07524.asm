; DESCRIPTION: Draws a green line from (178, 236) to (118, 193).
; PLAN: r0=178(x1), r1=236(y1), r2=118(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 236
LDI r2, 118
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
