; DESCRIPTION: Renders a white line between points (225, 173) and (451, 137).
; PLAN: r0=225(x1), r1=173(y1), r2=451(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 225
LDI r1, 173
LDI r2, 451
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
