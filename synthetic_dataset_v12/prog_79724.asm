; DESCRIPTION: Composite: Renders a orange disk with center (183, 193) and radius 32 then Places a black line segment connecting (55, 72) to (6, 131) then Places a cyan dot at position (221, 19).
; PLAN: r0=183(x), r1=193(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=55(x1), r6=72(y1), r7=6(x2), r8=131(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=221(x), r11=19(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 183
LDI r1, 193
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 55
LDI r6, 72
LDI r7, 6
LDI r8, 131
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 221
LDI r11, 19
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
