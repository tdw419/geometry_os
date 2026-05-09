; DESCRIPTION: Renders a blue line between points (304, 164) and (502, 244).
; PLAN: r0=304(x1), r1=164(y1), r2=502(x2), r3=244(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 164
LDI r2, 502
LDI r3, 244
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
