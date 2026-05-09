; DESCRIPTION: Renders a black line between points (50, 213) and (153, 133).
; PLAN: r0=50(x1), r1=213(y1), r2=153(x2), r3=133(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 213
LDI r2, 153
LDI r3, 133
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
