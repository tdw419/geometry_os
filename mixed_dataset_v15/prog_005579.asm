; DESCRIPTION: Composite: Places a white dot at position (182, 228) then Places a magenta circle of radius 37 at center (457, 68).
; PLAN: r0=182(x), r1=228(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=457(x), r6=68(y), r7=37(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 182
LDI r1, 228
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 457
LDI r6, 68
LDI r7, 37
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
