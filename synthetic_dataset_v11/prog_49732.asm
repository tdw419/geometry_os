; DESCRIPTION: Renders a green line between points (131, 78) and (231, 193).
; PLAN: r0=131(x1), r1=78(y1), r2=231(x2), r3=193(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 131
LDI r1, 78
LDI r2, 231
LDI r3, 193
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
