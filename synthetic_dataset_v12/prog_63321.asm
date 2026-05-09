; DESCRIPTION: Renders a yellow line between points (153, 4) and (449, 27).
; PLAN: r0=153(x1), r1=4(y1), r2=449(x2), r3=27(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 4
LDI r2, 449
LDI r3, 27
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
