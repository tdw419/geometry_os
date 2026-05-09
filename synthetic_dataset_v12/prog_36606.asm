; DESCRIPTION: Composite: Creates a orange circular shape at (132, 77) with radius 47 then Renders a black line between points (294, 187) and (407, 93) then Places a cyan dot at position (368, 155).
; PLAN: r0=132(x), r1=77(y), r2=47(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=294(x1), r6=187(y1), r7=407(x2), r8=93(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=368(x), r11=155(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 132
LDI r1, 77
LDI r2, 47
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 294
LDI r6, 187
LDI r7, 407
LDI r8, 93
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 368
LDI r11, 155
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
