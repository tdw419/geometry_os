; DESCRIPTION: Renders a blue line between points (502, 141) and (233, 240).
; PLAN: r0=502(x1), r1=141(y1), r2=233(x2), r3=240(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 502
LDI r1, 141
LDI r2, 233
LDI r3, 240
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
