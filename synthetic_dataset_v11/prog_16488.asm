; DESCRIPTION: Renders a red line between points (224, 204) and (226, 25).
; PLAN: r0=224(x1), r1=204(y1), r2=226(x2), r3=25(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 204
LDI r2, 226
LDI r3, 25
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
