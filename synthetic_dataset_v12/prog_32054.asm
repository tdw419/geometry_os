; DESCRIPTION: Composite: Places a magenta dot at position (263, 53) then Places a magenta circle of radius 38 at center (225, 125).
; PLAN: r0=263(x), r1=53(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=225(x), r6=125(y), r7=38(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 263
LDI r1, 53
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 225
LDI r6, 125
LDI r7, 38
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
