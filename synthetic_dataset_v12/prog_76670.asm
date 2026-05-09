; DESCRIPTION: Renders a blue line between points (368, 44) and (502, 197).
; PLAN: r0=368(x1), r1=44(y1), r2=502(x2), r3=197(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 44
LDI r2, 502
LDI r3, 197
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
