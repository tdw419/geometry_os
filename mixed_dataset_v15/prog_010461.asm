; DESCRIPTION: Composite: Renders a blue disk with center (230, 203) and radius 50 then Sets a single green pixel at (173, 253).
; PLAN: r0=230(x), r1=203(y), r2=50(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=173(x), r6=253(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 230
LDI r1, 203
LDI r2, 50
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 173
LDI r6, 253
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
