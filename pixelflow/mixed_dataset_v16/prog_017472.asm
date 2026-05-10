; DESCRIPTION: Renders a green line between points (222, 196) and (362, 29).
; PLAN: r0=222(x1), r1=196(y1), r2=362(x2), r3=29(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 196
LDI r2, 362
LDI r3, 29
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
