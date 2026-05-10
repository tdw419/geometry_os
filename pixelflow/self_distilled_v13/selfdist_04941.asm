; DESCRIPTION: Draws a orange line from (71, 130) to (259, 27).
; PLAN: r0=71(x1), r1=130(y1), r2=259(x2), r3=27(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 130
LDI r2, 259
LDI r3, 27
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
