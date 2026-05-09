; DESCRIPTION: Draws a yellow line from (487, 73) to (83, 207).
; PLAN: r0=487(x1), r1=73(y1), r2=83(x2), r3=207(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 73
LDI r2, 83
LDI r3, 207
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
