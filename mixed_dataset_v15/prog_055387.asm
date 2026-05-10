; DESCRIPTION: Composite: Draws a white circle centered at (55, 184) with radius 40 then Places a cyan dot at position (343, 154) then Draws a cyan line from (168, 136) to (343, 188).
; PLAN: r0=55(x), r1=184(y), r2=40(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=343(x), r6=154(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=168(x1), r11=136(y1), r12=343(x2), r13=188(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 55
LDI r1, 184
LDI r2, 40
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 343
LDI r6, 154
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 168
LDI r11, 136
LDI r12, 343
LDI r13, 188
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
