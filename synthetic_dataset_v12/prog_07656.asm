; DESCRIPTION: Composite: Places a white dot at position (38, 120) then Renders a green disk with center (407, 169) and radius 38.
; PLAN: r0=38(x), r1=120(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=407(x), r6=169(y), r7=38(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 38
LDI r1, 120
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 407
LDI r6, 169
LDI r7, 38
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
