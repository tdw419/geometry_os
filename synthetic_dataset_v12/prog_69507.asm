; DESCRIPTION: Renders a green disk with center (363, 209) and radius 38.
; PLAN: r0=363(x), r1=209(y), r2=38(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 363
LDI r1, 209
LDI r2, 38
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
HALT
