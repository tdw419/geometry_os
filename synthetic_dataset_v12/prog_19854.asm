; DESCRIPTION: Renders a blue line between points (279, 186) and (424, 210).
; PLAN: r0=279(x1), r1=186(y1), r2=424(x2), r3=210(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 186
LDI r2, 424
LDI r3, 210
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
