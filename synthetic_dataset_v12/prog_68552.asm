; DESCRIPTION: Composite: Places a yellow dot at position (54, 28) then Renders a yellow disk with center (317, 161) and radius 47.
; PLAN: r0=54(x), r1=28(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=317(x), r6=161(y), r7=47(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 54
LDI r1, 28
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 317
LDI r6, 161
LDI r7, 47
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
