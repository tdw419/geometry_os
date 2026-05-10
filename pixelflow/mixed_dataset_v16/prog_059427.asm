; DESCRIPTION: Renders a purple line between points (224, 24) and (502, 73).
; PLAN: r0=224(x1), r1=24(y1), r2=502(x2), r3=73(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 24
LDI r2, 502
LDI r3, 73
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
