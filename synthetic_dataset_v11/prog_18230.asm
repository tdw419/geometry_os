; DESCRIPTION: Draws a yellow line from (96, 61) to (50, 52).
; PLAN: r0=96(x1), r1=61(y1), r2=50(x2), r3=52(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 61
LDI r2, 50
LDI r3, 52
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
