; DESCRIPTION: Composite: Places a black dot at position (466, 104) then Places a yellow circle of radius 27 at center (59, 123).
; PLAN: r0=466(x), r1=104(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=59(x), r6=123(y), r7=27(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 466
LDI r1, 104
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 59
LDI r6, 123
LDI r7, 27
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
