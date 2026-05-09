; DESCRIPTION: Renders a red line between points (407, 126) and (334, 239).
; PLAN: r0=407(x1), r1=126(y1), r2=334(x2), r3=239(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 407
LDI r1, 126
LDI r2, 334
LDI r3, 239
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
