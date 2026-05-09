; DESCRIPTION: Composite: Renders a white disk with center (154, 33) and radius 29 then Sets a single red pixel at (403, 214).
; PLAN: r0=154(x), r1=33(y), r2=29(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x), r6=214(y), r7=0xFF0000(color). Op: PSET r5, r6, r7.
LDI r0, 154
LDI r1, 33
LDI r2, 29
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 214
LDI r7, 0xFF0000
PSET r5, r6, r7
HALT
