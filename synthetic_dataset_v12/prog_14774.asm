; DESCRIPTION: Draws a green line from (437, 124) to (483, 214).
; PLAN: r0=437(x1), r1=124(y1), r2=483(x2), r3=214(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 124
LDI r2, 483
LDI r3, 214
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
