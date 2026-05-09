; DESCRIPTION: Renders a green line between points (4, 55) and (32, 234).
; PLAN: r0=4(x1), r1=55(y1), r2=32(x2), r3=234(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 55
LDI r2, 32
LDI r3, 234
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
