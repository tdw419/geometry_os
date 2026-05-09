; DESCRIPTION: Renders a black line between points (231, 177) and (35, 182).
; PLAN: r0=231(x1), r1=177(y1), r2=35(x2), r3=182(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 177
LDI r2, 35
LDI r3, 182
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
