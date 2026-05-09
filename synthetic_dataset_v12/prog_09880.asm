; DESCRIPTION: Composite: Sets a single green pixel at (193, 109) then Renders a blue disk with center (313, 111) and radius 42.
; PLAN: r0=193(x), r1=109(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=313(x), r6=111(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 193
LDI r1, 109
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 313
LDI r6, 111
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
