; DESCRIPTION: Renders a black line between points (218, 23) and (161, 177).
; PLAN: r0=218(x1), r1=23(y1), r2=161(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 23
LDI r2, 161
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
