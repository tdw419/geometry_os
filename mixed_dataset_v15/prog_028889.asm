; DESCRIPTION: Draws a green line from (361, 70) to (309, 31).
; PLAN: r0=361(x1), r1=70(y1), r2=309(x2), r3=31(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 361
LDI r1, 70
LDI r2, 309
LDI r3, 31
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
