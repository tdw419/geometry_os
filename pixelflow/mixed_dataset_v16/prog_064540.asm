; DESCRIPTION: Composite: Draws a cyan circle centered at (179, 55) with radius 31 then Renders a magenta line between points (331, 186) and (29, 74) then Places a green dot at position (55, 129).
; PLAN: r0=179(x), r1=55(y), r2=31(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=331(x1), r6=186(y1), r7=29(x2), r8=74(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=55(x), r11=129(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 179
LDI r1, 55
LDI r2, 31
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 331
LDI r6, 186
LDI r7, 29
LDI r8, 74
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 55
LDI r11, 129
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
