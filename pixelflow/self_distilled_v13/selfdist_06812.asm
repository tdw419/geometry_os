; DESCRIPTION: Draws a yellow line from (95, 19) to (103, 93).
; PLAN: r0=95(x1), r1=19(y1), r2=103(x2), r3=93(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 19
LDI r2, 103
LDI r3, 93
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
