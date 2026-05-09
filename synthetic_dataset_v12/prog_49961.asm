; DESCRIPTION: Composite: Places a orange dot at position (189, 0) then Renders a red disk with center (215, 135) and radius 63.
; PLAN: r0=189(x), r1=0(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=215(x), r6=135(y), r7=63(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 189
LDI r1, 0
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 215
LDI r6, 135
LDI r7, 63
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
