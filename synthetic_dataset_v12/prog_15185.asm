; DESCRIPTION: Draws a yellow line from (328, 54) to (12, 193).
; PLAN: r0=328(x1), r1=54(y1), r2=12(x2), r3=193(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 54
LDI r2, 12
LDI r3, 193
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
