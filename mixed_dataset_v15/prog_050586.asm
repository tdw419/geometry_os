; DESCRIPTION: Renders a white line between points (368, 224) and (349, 149).
; PLAN: r0=368(x1), r1=224(y1), r2=349(x2), r3=149(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 224
LDI r2, 349
LDI r3, 149
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
