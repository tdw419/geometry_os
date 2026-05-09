; DESCRIPTION: Composite: Places a magenta dot at position (1, 135) then Renders a magenta disk with center (463, 96) and radius 13.
; PLAN: r0=1(x), r1=135(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=463(x), r6=96(y), r7=13(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 1
LDI r1, 135
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 463
LDI r6, 96
LDI r7, 13
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
