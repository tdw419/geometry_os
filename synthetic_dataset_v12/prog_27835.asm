; DESCRIPTION: Draws a yellow line from (27, 10) to (291, 7).
; PLAN: r0=27(x1), r1=10(y1), r2=291(x2), r3=7(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 10
LDI r2, 291
LDI r3, 7
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
