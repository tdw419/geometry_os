; DESCRIPTION: Composite: Sets a single white pixel at (268, 133) then Renders a orange disk with center (127, 103) and radius 67.
; PLAN: r0=268(x), r1=133(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=103(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 268
LDI r1, 133
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 127
LDI r6, 103
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
