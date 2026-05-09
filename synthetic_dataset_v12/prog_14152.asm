; DESCRIPTION: Composite: Sets a single yellow pixel at (238, 150) then Creates a cyan rectangular region at (259, 51) spanning 25 by 25 pixels then Places a yellow circle of radius 23 at center (386, 64).
; PLAN: r0=238(x), r1=150(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=259(x), r6=51(y), r7=25(width), r8=25(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=386(x), r11=64(y), r12=23(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 238
LDI r1, 150
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 259
LDI r6, 51
LDI r7, 25
LDI r8, 25
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 386
LDI r11, 64
LDI r12, 23
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
