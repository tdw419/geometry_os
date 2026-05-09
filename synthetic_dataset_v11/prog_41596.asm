; DESCRIPTION: Draws a orange line from (242, 86) to (217, 7).
; PLAN: r0=242(x1), r1=86(y1), r2=217(x2), r3=7(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 86
LDI r2, 217
LDI r3, 7
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
