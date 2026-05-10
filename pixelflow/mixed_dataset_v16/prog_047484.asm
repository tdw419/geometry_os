; DESCRIPTION: Renders a white line between points (295, 219) and (153, 241).
; PLAN: r0=295(x1), r1=219(y1), r2=153(x2), r3=241(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 219
LDI r2, 153
LDI r3, 241
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
