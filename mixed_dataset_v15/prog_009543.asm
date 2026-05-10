; DESCRIPTION: Composite: Creates a cyan circular shape at (214, 102) with radius 45 then Places a cyan line segment connecting (48, 191) to (496, 221) then Places a purple dot at position (342, 182).
; PLAN: r0=214(x), r1=102(y), r2=45(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=48(x1), r6=191(y1), r7=496(x2), r8=221(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=342(x), r11=182(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 214
LDI r1, 102
LDI r2, 45
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 48
LDI r6, 191
LDI r7, 496
LDI r8, 221
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 342
LDI r11, 182
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
