; DESCRIPTION: Composite: Creates a cyan circular shape at (138, 168) with radius 23 then Renders a cyan line between points (437, 79) and (170, 98) then Places a orange dot at position (93, 121).
; PLAN: r0=138(x), r1=168(y), r2=23(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=437(x1), r6=79(y1), r7=170(x2), r8=98(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=93(x), r11=121(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 138
LDI r1, 168
LDI r2, 23
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 437
LDI r6, 79
LDI r7, 170
LDI r8, 98
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 93
LDI r11, 121
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
