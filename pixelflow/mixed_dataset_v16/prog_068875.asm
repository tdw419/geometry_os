; DESCRIPTION: Composite: Places a yellow dot at position (194, 30) then Places a magenta circle of radius 63 at center (410, 162).
; PLAN: r0=194(x), r1=30(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=410(x), r6=162(y), r7=63(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 194
LDI r1, 30
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 410
LDI r6, 162
LDI r7, 63
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
