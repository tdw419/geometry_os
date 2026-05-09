; DESCRIPTION: Draws a white line from (310, 124) to (253, 193).
; PLAN: r0=310(x1), r1=124(y1), r2=253(x2), r3=193(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 124
LDI r2, 253
LDI r3, 193
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
