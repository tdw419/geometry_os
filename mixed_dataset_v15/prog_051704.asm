; DESCRIPTION: Renders a yellow line between points (405, 254) and (269, 78).
; PLAN: r0=405(x1), r1=254(y1), r2=269(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 254
LDI r2, 269
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
