; DESCRIPTION: Draws a green line from (160, 183) to (253, 200).
; PLAN: r0=160(x1), r1=183(y1), r2=253(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 183
LDI r2, 253
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
