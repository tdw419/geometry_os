; DESCRIPTION: Draws a green line from (308, 157) to (355, 161).
; PLAN: r0=308(x1), r1=157(y1), r2=355(x2), r3=161(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 157
LDI r2, 355
LDI r3, 161
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
