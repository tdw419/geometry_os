; DESCRIPTION: Composite: Places a white line segment connecting (383, 214) to (468, 98) then Places a yellow circle of radius 32 at center (253, 71).
; PLAN: r0=383(x1), r1=214(y1), r2=468(x2), r3=98(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=253(x), r6=71(y), r7=32(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 383
LDI r1, 214
LDI r2, 468
LDI r3, 98
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 71
LDI r7, 32
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
