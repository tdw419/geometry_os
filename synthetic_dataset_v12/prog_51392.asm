; DESCRIPTION: Renders a black line between points (403, 234) and (128, 169).
; PLAN: r0=403(x1), r1=234(y1), r2=128(x2), r3=169(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 234
LDI r2, 128
LDI r3, 169
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
