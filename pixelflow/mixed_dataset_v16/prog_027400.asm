; DESCRIPTION: Composite: Places a magenta dot at position (407, 239) then Renders a purple disk with center (367, 184) and radius 70.
; PLAN: r0=407(x), r1=239(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=367(x), r6=184(y), r7=70(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 407
LDI r1, 239
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 367
LDI r6, 184
LDI r7, 70
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
