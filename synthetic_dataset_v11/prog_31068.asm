; DESCRIPTION: Composite: . Then Renders a green disk with center (115, 152) and radius 10. Then Places a yellow dot at position (180, 80).
; PLAN: r0=115(x), r1=152(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=180(x), r1=80(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
; DESCRIPTION: Renders a green disk with center (115, 152) and radius 10.
; PLAN: r0=115(x), r1=152(y), r2=10(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 115
LDI r1, 152
LDI r2, 10
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Places a yellow dot at position (180, 80).
; PLAN: r0=180(x), r1=80(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2.
LDI r0, 180
LDI r1, 80
LDI r2, 0xFFFF00
PSET r0, r1, r2
HALT
