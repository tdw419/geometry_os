; DESCRIPTION: Composite: Places a yellow dot at position (97, 175) then Renders a cyan disk with center (207, 189) and radius 66 then Places a orange line segment connecting (355, 146) to (355, 18).
; PLAN: r0=97(x), r1=175(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=207(x), r6=189(y), r7=66(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=355(x1), r11=146(y1), r12=355(x2), r13=18(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 97
LDI r1, 175
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 207
LDI r6, 189
LDI r7, 66
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 355
LDI r11, 146
LDI r12, 355
LDI r13, 18
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
