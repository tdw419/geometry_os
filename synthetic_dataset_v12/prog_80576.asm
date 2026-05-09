; DESCRIPTION: Composite: Draws a green circle centered at (184, 111) with radius 57 then Renders a magenta line between points (394, 73) and (123, 184) then Places a blue dot at position (430, 177).
; PLAN: r0=184(x), r1=111(y), r2=57(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=394(x1), r6=73(y1), r7=123(x2), r8=184(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=430(x), r11=177(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 184
LDI r1, 111
LDI r2, 57
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 394
LDI r6, 73
LDI r7, 123
LDI r8, 184
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 430
LDI r11, 177
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
