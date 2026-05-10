; DESCRIPTION: Renders a black line between points (217, 161) and (418, 204).
; PLAN: r0=217(x1), r1=161(y1), r2=418(x2), r3=204(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 161
LDI r2, 418
LDI r3, 204
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
