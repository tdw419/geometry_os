; DESCRIPTION: Renders a white line between points (37, 224) and (494, 220).
; PLAN: r0=37(x1), r1=224(y1), r2=494(x2), r3=220(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 224
LDI r2, 494
LDI r3, 220
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
