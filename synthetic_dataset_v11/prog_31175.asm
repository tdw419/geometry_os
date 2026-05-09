; DESCRIPTION: Renders a white line between points (231, 107) and (234, 81).
; PLAN: r0=231(x1), r1=107(y1), r2=234(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 107
LDI r2, 234
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
