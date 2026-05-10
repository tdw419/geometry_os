; DESCRIPTION: Composite: Places a magenta dot at position (400, 197) then Draws a magenta circle centered at (386, 135) with radius 45.
; PLAN: r0=400(x), r1=197(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=386(x), r6=135(y), r7=45(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 197
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 386
LDI r6, 135
LDI r7, 45
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
