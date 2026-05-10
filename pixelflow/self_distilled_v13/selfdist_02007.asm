; DESCRIPTION: Draws a yellow line from (27, 175) to (95, 12).
; PLAN: r0=27(x1), r1=175(y1), r2=95(x2), r3=12(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 175
LDI r2, 95
LDI r3, 12
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
