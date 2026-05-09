; DESCRIPTION: Renders a black line between points (389, 186) and (175, 113).
; PLAN: r0=389(x1), r1=186(y1), r2=175(x2), r3=113(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 186
LDI r2, 175
LDI r3, 113
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
