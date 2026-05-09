; DESCRIPTION: Composite: Renders a magenta disk with center (150, 151) and radius 73 then Places a white dot at position (179, 244).
; PLAN: r0=150(x), r1=151(y), r2=73(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x), r6=244(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7.
LDI r0, 150
LDI r1, 151
LDI r2, 73
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 244
LDI r7, 0xFFFFFF
PSET r5, r6, r7
HALT
