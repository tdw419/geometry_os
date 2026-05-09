; DESCRIPTION: Renders a yellow line between points (160, 61) and (198, 19).
; PLAN: r0=160(x1), r1=61(y1), r2=198(x2), r3=19(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 61
LDI r2, 198
LDI r3, 19
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
