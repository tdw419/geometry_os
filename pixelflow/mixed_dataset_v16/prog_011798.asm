; DESCRIPTION: Renders a blue line between points (286, 214) and (295, 71).
; PLAN: r0=286(x1), r1=214(y1), r2=295(x2), r3=71(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 214
LDI r2, 295
LDI r3, 71
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
