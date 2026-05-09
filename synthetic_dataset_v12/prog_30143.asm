; DESCRIPTION: Renders a blue line between points (210, 167) and (248, 174).
; PLAN: r0=210(x1), r1=167(y1), r2=248(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 167
LDI r2, 248
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
