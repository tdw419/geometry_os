; DESCRIPTION: Composite: Places a white dot at position (399, 14) then Renders a magenta disk with center (320, 161) and radius 43.
; PLAN: r0=399(x), r1=14(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=320(x), r6=161(y), r7=43(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 399
LDI r1, 14
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 320
LDI r6, 161
LDI r7, 43
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
