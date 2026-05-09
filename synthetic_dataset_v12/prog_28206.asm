; DESCRIPTION: Draws a green line from (166, 148) to (290, 183).
; PLAN: r0=166(x1), r1=148(y1), r2=290(x2), r3=183(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 148
LDI r2, 290
LDI r3, 183
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
