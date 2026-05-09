; DESCRIPTION: Renders a yellow line between points (198, 59) and (145, 213).
; PLAN: r0=198(x1), r1=59(y1), r2=145(x2), r3=213(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 59
LDI r2, 145
LDI r3, 213
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
