; DESCRIPTION: Draws a green line from (125, 24) to (35, 204).
; PLAN: r0=125(x1), r1=24(y1), r2=35(x2), r3=204(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 24
LDI r2, 35
LDI r3, 204
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
