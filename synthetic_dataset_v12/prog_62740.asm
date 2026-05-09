; DESCRIPTION: Composite: Creates a magenta circular shape at (394, 137) with radius 71 then Renders a magenta line between points (200, 254) and (361, 180) then Places a orange dot at position (477, 137).
; PLAN: r0=394(x), r1=137(y), r2=71(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x1), r6=254(y1), r7=361(x2), r8=180(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=477(x), r11=137(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 394
LDI r1, 137
LDI r2, 71
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 254
LDI r7, 361
LDI r8, 180
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 477
LDI r11, 137
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
