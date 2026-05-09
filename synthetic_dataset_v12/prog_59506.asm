; DESCRIPTION: Renders a black line between points (352, 244) and (188, 120).
; PLAN: r0=352(x1), r1=244(y1), r2=188(x2), r3=120(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 244
LDI r2, 188
LDI r3, 120
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
