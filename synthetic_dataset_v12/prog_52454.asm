; DESCRIPTION: Renders a black line between points (296, 209) and (59, 152).
; PLAN: r0=296(x1), r1=209(y1), r2=59(x2), r3=152(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 209
LDI r2, 59
LDI r3, 152
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
