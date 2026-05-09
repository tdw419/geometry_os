; DESCRIPTION: Composite: . Then Renders a cyan line between points (52, 8) and (249, 227). Then Renders a yellow disk with center (203, 209) and radius 38.
; PLAN: r0=52(x1), r1=8(y1), r2=249(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r0=203(x), r1=209(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Renders a cyan line between points (52, 8) and (249, 227).
; PLAN: r0=52(x1), r1=8(y1), r2=249(x2), r3=227(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 8
LDI r2, 249
LDI r3, 227
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
; DESCRIPTION: Renders a yellow disk with center (203, 209) and radius 38.
; PLAN: r0=203(x), r1=209(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 203
LDI r1, 209
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
