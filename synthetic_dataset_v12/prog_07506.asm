; DESCRIPTION: Draws a green line from (290, 139) to (429, 61).
; PLAN: r0=290(x1), r1=139(y1), r2=429(x2), r3=61(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 139
LDI r2, 429
LDI r3, 61
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
