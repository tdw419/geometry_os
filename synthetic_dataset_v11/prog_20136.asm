; DESCRIPTION: Renders a blue line between points (202, 44) and (39, 209).
; PLAN: r0=202(x1), r1=44(y1), r2=39(x2), r3=209(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 44
LDI r2, 39
LDI r3, 209
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
