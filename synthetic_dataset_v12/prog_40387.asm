; DESCRIPTION: Composite: Creates a cyan circular shape at (291, 98) with radius 25 then Places a cyan dot at position (463, 52) then Places a blue line segment connecting (238, 41) to (323, 45).
; PLAN: r0=291(x), r1=98(y), r2=25(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=463(x), r6=52(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=238(x1), r11=41(y1), r12=323(x2), r13=45(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 291
LDI r1, 98
LDI r2, 25
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 463
LDI r6, 52
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 238
LDI r11, 41
LDI r12, 323
LDI r13, 45
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
