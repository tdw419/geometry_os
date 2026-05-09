; DESCRIPTION: Composite: Creates a blue circular shape at (405, 180) with radius 33 then Renders a red line between points (33, 52) and (264, 76) then Places a magenta dot at position (125, 61).
; PLAN: r0=405(x), r1=180(y), r2=33(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=33(x1), r6=52(y1), r7=264(x2), r8=76(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=125(x), r11=61(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 405
LDI r1, 180
LDI r2, 33
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 33
LDI r6, 52
LDI r7, 264
LDI r8, 76
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 125
LDI r11, 61
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
