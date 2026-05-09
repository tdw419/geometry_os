; DESCRIPTION: Composite: Places a magenta dot at position (249, 204) then Renders a magenta disk with center (86, 152) and radius 46.
; PLAN: r0=249(x), r1=204(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=86(x), r6=152(y), r7=46(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 249
LDI r1, 204
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 86
LDI r6, 152
LDI r7, 46
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
