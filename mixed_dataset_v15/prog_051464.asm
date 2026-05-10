; DESCRIPTION: Composite: Places a green dot at position (42, 134) then Renders a magenta disk with center (400, 182) and radius 53.
; PLAN: r0=42(x), r1=134(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=400(x), r6=182(y), r7=53(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 42
LDI r1, 134
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 400
LDI r6, 182
LDI r7, 53
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
