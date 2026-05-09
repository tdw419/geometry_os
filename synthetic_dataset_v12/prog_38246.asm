; DESCRIPTION: Renders a green line between points (129, 115) and (362, 125).
; PLAN: r0=129(x1), r1=115(y1), r2=362(x2), r3=125(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 115
LDI r2, 362
LDI r3, 125
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
