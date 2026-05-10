; DESCRIPTION: Composite: Places a black dot at position (337, 84) then Renders a magenta disk with center (290, 202) and radius 23.
; PLAN: r0=337(x), r1=84(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=290(x), r6=202(y), r7=23(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 337
LDI r1, 84
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 290
LDI r6, 202
LDI r7, 23
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
