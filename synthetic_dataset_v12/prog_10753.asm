; DESCRIPTION: Composite: Places a black dot at position (349, 52) then Renders a blue disk with center (395, 57) and radius 54.
; PLAN: r0=349(x), r1=52(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=57(y), r7=54(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 349
LDI r1, 52
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 395
LDI r6, 57
LDI r7, 54
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
