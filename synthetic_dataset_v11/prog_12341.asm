; DESCRIPTION: Renders a white line between points (64, 91) and (224, 226).
; PLAN: r0=64(x1), r1=91(y1), r2=224(x2), r3=226(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 91
LDI r2, 224
LDI r3, 226
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
