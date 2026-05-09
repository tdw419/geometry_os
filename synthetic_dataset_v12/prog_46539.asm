; DESCRIPTION: Renders a white line between points (19, 190) and (239, 130).
; PLAN: r0=19(x1), r1=190(y1), r2=239(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 190
LDI r2, 239
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
