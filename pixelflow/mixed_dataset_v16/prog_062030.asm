; DESCRIPTION: Renders a white line between points (84, 165) and (321, 174).
; PLAN: r0=84(x1), r1=165(y1), r2=321(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 84
LDI r1, 165
LDI r2, 321
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
