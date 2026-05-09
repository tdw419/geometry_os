; DESCRIPTION: Renders a blue line between points (120, 253) and (502, 104).
; PLAN: r0=120(x1), r1=253(y1), r2=502(x2), r3=104(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 253
LDI r2, 502
LDI r3, 104
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
