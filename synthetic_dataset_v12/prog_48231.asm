; DESCRIPTION: Renders a green line between points (257, 130) and (303, 220).
; PLAN: r0=257(x1), r1=130(y1), r2=303(x2), r3=220(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 257
LDI r1, 130
LDI r2, 303
LDI r3, 220
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
