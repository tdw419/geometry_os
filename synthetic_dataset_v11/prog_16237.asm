; DESCRIPTION: Renders a black line between points (231, 210) and (202, 137).
; PLAN: r0=231(x1), r1=210(y1), r2=202(x2), r3=137(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 210
LDI r2, 202
LDI r3, 137
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
