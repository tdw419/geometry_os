; DESCRIPTION: Draws a yellow line from (426, 182) to (372, 196).
; PLAN: r0=426(x1), r1=182(y1), r2=372(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 182
LDI r2, 372
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
