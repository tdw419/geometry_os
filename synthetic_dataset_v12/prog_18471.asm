; DESCRIPTION: Composite: Places a cyan dot at position (394, 29) then Places a cyan line segment connecting (490, 20) to (206, 234) then Draws a green circle centered at (361, 73) with radius 29.
; PLAN: r0=394(x), r1=29(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=490(x1), r6=20(y1), r7=206(x2), r8=234(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=361(x), r11=73(y), r12=29(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 394
LDI r1, 29
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 490
LDI r6, 20
LDI r7, 206
LDI r8, 234
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 361
LDI r11, 73
LDI r12, 29
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
