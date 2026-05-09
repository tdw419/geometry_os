; DESCRIPTION: Composite: Places a white dot at position (228, 59) then Places a white circle of radius 53 at center (162, 193).
; PLAN: r0=228(x), r1=59(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=162(x), r6=193(y), r7=53(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 228
LDI r1, 59
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 162
LDI r6, 193
LDI r7, 53
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
