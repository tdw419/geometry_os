; DESCRIPTION: Draws a green line from (163, 167) to (487, 183).
; PLAN: r0=163(x1), r1=167(y1), r2=487(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 167
LDI r2, 487
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
