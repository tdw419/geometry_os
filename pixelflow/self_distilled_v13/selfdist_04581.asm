; DESCRIPTION: Draws a white line from (318, 129) to (44, 108).
; PLAN: r0=318(x1), r1=129(y1), r2=44(x2), r3=108(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 129
LDI r2, 44
LDI r3, 108
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
