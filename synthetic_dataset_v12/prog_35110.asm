; DESCRIPTION: Renders a black line between points (405, 231) and (52, 177).
; PLAN: r0=405(x1), r1=231(y1), r2=52(x2), r3=177(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 231
LDI r2, 52
LDI r3, 177
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
