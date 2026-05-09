; DESCRIPTION: Draws a yellow line from (32, 18) to (264, 93).
; PLAN: r0=32(x1), r1=18(y1), r2=264(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 32
LDI r1, 18
LDI r2, 264
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
