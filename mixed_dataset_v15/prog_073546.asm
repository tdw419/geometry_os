; DESCRIPTION: Renders a black line between points (367, 146) and (239, 155).
; PLAN: r0=367(x1), r1=146(y1), r2=239(x2), r3=155(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 146
LDI r2, 239
LDI r3, 155
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
