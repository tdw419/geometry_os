; DESCRIPTION: Composite: Draws a cyan circle centered at (475, 63) with radius 28 then Draws a purple line from (98, 202) to (215, 189) then Places a purple dot at position (341, 191).
; PLAN: r0=475(x), r1=63(y), r2=28(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=98(x1), r6=202(y1), r7=215(x2), r8=189(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=191(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 475
LDI r1, 63
LDI r2, 28
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 98
LDI r6, 202
LDI r7, 215
LDI r8, 189
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 191
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
