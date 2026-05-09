; DESCRIPTION: Composite: Sets a single green pixel at (507, 79) then Renders a green disk with center (400, 161) and radius 45.
; PLAN: r0=507(x), r1=79(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=161(y), r7=45(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 507
LDI r1, 79
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 400
LDI r6, 161
LDI r7, 45
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
