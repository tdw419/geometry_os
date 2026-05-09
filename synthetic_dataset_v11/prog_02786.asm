; DESCRIPTION: Composite: . Then Renders a white line between points (110, 251) and (136, 152). Then Renders a cyan disk with center (54, 170) and radius 11.
; PLAN: r0=110(x1), r1=251(y1), r2=136(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=54(x), r1=170(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a white line between points (110, 251) and (136, 152).
; PLAN: r0=110(x1), r1=251(y1), r2=136(x2), r3=152(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 110
LDI r1, 251
LDI r2, 136
LDI r3, 152
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a cyan disk with center (54, 170) and radius 11.
; PLAN: r0=54(x), r1=170(y), r2=11(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 54
LDI r1, 170
LDI r2, 11
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
HALT
