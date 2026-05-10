; DESCRIPTION: Renders a yellow line between points (286, 21) and (198, 166).
; PLAN: r0=286(x1), r1=21(y1), r2=198(x2), r3=166(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 21
LDI r2, 198
LDI r3, 166
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
