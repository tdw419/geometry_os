; DESCRIPTION: Renders a white line between points (317, 224) and (205, 161).
; PLAN: r0=317(x1), r1=224(y1), r2=205(x2), r3=161(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 224
LDI r2, 205
LDI r3, 161
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
