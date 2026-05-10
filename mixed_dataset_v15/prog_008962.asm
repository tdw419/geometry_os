; DESCRIPTION: Renders a green line between points (303, 17) and (382, 240).
; PLAN: r0=303(x1), r1=17(y1), r2=382(x2), r3=240(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 17
LDI r2, 382
LDI r3, 240
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
