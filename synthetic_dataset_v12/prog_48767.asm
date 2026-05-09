; DESCRIPTION: Renders a green line between points (362, 204) and (165, 43).
; PLAN: r0=362(x1), r1=204(y1), r2=165(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 204
LDI r2, 165
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
