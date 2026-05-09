; DESCRIPTION: Renders a purple line between points (449, 196) and (494, 83).
; PLAN: r0=449(x1), r1=196(y1), r2=494(x2), r3=83(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 196
LDI r2, 494
LDI r3, 83
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
