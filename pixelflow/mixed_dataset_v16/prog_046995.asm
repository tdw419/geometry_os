; DESCRIPTION: Renders a white line between points (311, 148) and (218, 176).
; PLAN: r0=311(x1), r1=148(y1), r2=218(x2), r3=176(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 148
LDI r2, 218
LDI r3, 176
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
