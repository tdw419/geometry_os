; DESCRIPTION: Composite: Places a yellow dot at position (462, 93) then Places a magenta circle of radius 44 at center (327, 103).
; PLAN: r0=462(x), r1=93(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=327(x), r6=103(y), r7=44(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 462
LDI r1, 93
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 327
LDI r6, 103
LDI r7, 44
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
