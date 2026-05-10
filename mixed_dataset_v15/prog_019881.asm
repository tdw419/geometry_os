; DESCRIPTION: Composite: Sets a single black pixel at (415, 214) then Places a magenta circle of radius 56 at center (416, 184).
; PLAN: r0=415(x), r1=214(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=416(x), r6=184(y), r7=56(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 415
LDI r1, 214
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 416
LDI r6, 184
LDI r7, 56
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
