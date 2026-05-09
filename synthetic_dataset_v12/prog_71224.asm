; DESCRIPTION: Draws a orange line from (27, 196) to (245, 77).
; PLAN: r0=27(x1), r1=196(y1), r2=245(x2), r3=77(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 196
LDI r2, 245
LDI r3, 77
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
