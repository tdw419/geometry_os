; DESCRIPTION: Composite: Places a white dot at position (481, 114) then Renders a magenta disk with center (205, 154) and radius 60.
; PLAN: r0=481(x), r1=114(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=205(x), r6=154(y), r7=60(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 481
LDI r1, 114
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 205
LDI r6, 154
LDI r7, 60
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
