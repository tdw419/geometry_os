; DESCRIPTION: Draws a blue line from (487, 82) to (427, 83).
; PLAN: r0=487(x1), r1=82(y1), r2=427(x2), r3=83(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 487
LDI r1, 82
LDI r2, 427
LDI r3, 83
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
