; DESCRIPTION: Composite: Renders a white disk with center (82, 121) and radius 76 then Places a white line segment connecting (424, 192) to (267, 180) then Places a cyan dot at position (50, 162).
; PLAN: r0=82(x), r1=121(y), r2=76(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=424(x1), r6=192(y1), r7=267(x2), r8=180(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=50(x), r11=162(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 82
LDI r1, 121
LDI r2, 76
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 424
LDI r6, 192
LDI r7, 267
LDI r8, 180
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 50
LDI r11, 162
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
