; DESCRIPTION: Composite: Creates a purple circular shape at (398, 102) with radius 60 then Places a magenta dot at position (462, 228).
; PLAN: r0=398(x), r1=102(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=462(x), r6=228(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 398
LDI r1, 102
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 462
LDI r6, 228
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
