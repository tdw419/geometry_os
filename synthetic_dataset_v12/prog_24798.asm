; DESCRIPTION: Draws a green line from (204, 253) to (127, 89).
; PLAN: r0=204(x1), r1=253(y1), r2=127(x2), r3=89(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 253
LDI r2, 127
LDI r3, 89
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
