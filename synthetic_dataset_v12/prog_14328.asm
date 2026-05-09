; DESCRIPTION: Renders a blue line between points (264, 50) and (210, 202).
; PLAN: r0=264(x1), r1=50(y1), r2=210(x2), r3=202(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 50
LDI r2, 210
LDI r3, 202
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
