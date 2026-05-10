; DESCRIPTION: Renders a white line between points (305, 204) and (407, 254).
; PLAN: r0=305(x1), r1=204(y1), r2=407(x2), r3=254(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 204
LDI r2, 407
LDI r3, 254
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
