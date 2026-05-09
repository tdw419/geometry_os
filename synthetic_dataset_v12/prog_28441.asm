; DESCRIPTION: Renders a cyan line between points (310, 232) and (416, 109).
; PLAN: r0=310(x1), r1=232(y1), r2=416(x2), r3=109(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 232
LDI r2, 416
LDI r3, 109
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
HALT
