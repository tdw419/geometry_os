; DESCRIPTION: Renders a black line between points (243, 46) and (244, 168).
; PLAN: r0=243(x1), r1=46(y1), r2=244(x2), r3=168(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 46
LDI r2, 244
LDI r3, 168
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
