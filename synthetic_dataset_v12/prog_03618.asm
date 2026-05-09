; DESCRIPTION: Composite: Places a red dot at position (177, 73) then Renders a blue disk with center (479, 52) and radius 28 then Places a orange line segment connecting (411, 118) to (343, 190).
; PLAN: r0=177(x), r1=73(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=479(x), r6=52(y), r7=28(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=411(x1), r11=118(y1), r12=343(x2), r13=190(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 177
LDI r1, 73
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 479
LDI r6, 52
LDI r7, 28
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 411
LDI r11, 118
LDI r12, 343
LDI r13, 190
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
