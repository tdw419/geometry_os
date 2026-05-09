; DESCRIPTION: Composite: Renders a red disk with center (257, 151) and radius 77 then Draws a black line from (315, 18) to (19, 11) then Places a green dot at position (393, 231).
; PLAN: r0=257(x), r1=151(y), r2=77(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=315(x1), r6=18(y1), r7=19(x2), r8=11(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=393(x), r11=231(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 257
LDI r1, 151
LDI r2, 77
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 315
LDI r6, 18
LDI r7, 19
LDI r8, 11
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 393
LDI r11, 231
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
