; DESCRIPTION: Renders a white line between points (83, 145) and (210, 239).
; PLAN: r0=83(x1), r1=145(y1), r2=210(x2), r3=239(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 145
LDI r2, 210
LDI r3, 239
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
