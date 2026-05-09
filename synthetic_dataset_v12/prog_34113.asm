; DESCRIPTION: Renders a white line between points (254, 236) and (116, 76).
; PLAN: r0=254(x1), r1=236(y1), r2=116(x2), r3=76(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 236
LDI r2, 116
LDI r3, 76
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
