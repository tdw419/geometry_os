; DESCRIPTION: Composite: Renders a white line between points (191, 146) and (245, 104) then Renders a red disk with center (463, 50) and radius 29 then Places a cyan dot at position (29, 79).
; PLAN: r0=191(x1), r1=146(y1), r2=245(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=463(x), r6=50(y), r7=29(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=29(x), r11=79(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 191
LDI r1, 146
LDI r2, 245
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 50
LDI r7, 29
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 29
LDI r11, 79
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
