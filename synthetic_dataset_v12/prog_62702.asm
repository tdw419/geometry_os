; DESCRIPTION: Composite: Creates a yellow circular shape at (210, 131) with radius 71 then Places a black line segment connecting (472, 197) to (372, 242) then Places a red dot at position (24, 157).
; PLAN: r0=210(x), r1=131(y), r2=71(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=472(x1), r6=197(y1), r7=372(x2), r8=242(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=24(x), r11=157(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 210
LDI r1, 131
LDI r2, 71
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 472
LDI r6, 197
LDI r7, 372
LDI r8, 242
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 24
LDI r11, 157
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
