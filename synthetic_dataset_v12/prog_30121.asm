; DESCRIPTION: Draws a white line from (174, 10) to (129, 12).
; PLAN: r0=174(x1), r1=10(y1), r2=129(x2), r3=12(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 10
LDI r2, 129
LDI r3, 12
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
