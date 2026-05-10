; DESCRIPTION: Draws a green line from (429, 154) to (297, 130).
; PLAN: r0=429(x1), r1=154(y1), r2=297(x2), r3=130(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 429
LDI r1, 154
LDI r2, 297
LDI r3, 130
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
