; DESCRIPTION: Renders a yellow line between points (120, 164) and (234, 221).
; PLAN: r0=120(x1), r1=164(y1), r2=234(x2), r3=221(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 164
LDI r2, 234
LDI r3, 221
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
