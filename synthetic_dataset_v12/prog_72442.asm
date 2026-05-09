; DESCRIPTION: Renders a green line between points (436, 175) and (268, 24).
; PLAN: r0=436(x1), r1=175(y1), r2=268(x2), r3=24(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 436
LDI r1, 175
LDI r2, 268
LDI r3, 24
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
