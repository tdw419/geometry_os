; DESCRIPTION: Renders a black line between points (214, 61) and (29, 198).
; PLAN: r0=214(x1), r1=61(y1), r2=29(x2), r3=198(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 61
LDI r2, 29
LDI r3, 198
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
