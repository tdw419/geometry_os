; DESCRIPTION: Composite: Draws a yellow line from (8, 18) to (460, 3) then Creates a green circular shape at (404, 151) with radius 64 then Sets a single cyan pixel at (76, 33).
; PLAN: r0=8(x1), r1=18(y1), r2=460(x2), r3=3(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=151(y), r7=64(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=76(x), r11=33(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 8
LDI r1, 18
LDI r2, 460
LDI r3, 3
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 151
LDI r7, 64
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 76
LDI r11, 33
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
