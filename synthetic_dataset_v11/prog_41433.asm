; DESCRIPTION: Renders a white line between points (213, 233) and (200, 174).
; PLAN: r0=213(x1), r1=233(y1), r2=200(x2), r3=174(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 233
LDI r2, 200
LDI r3, 174
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
