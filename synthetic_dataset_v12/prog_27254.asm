; DESCRIPTION: Composite: Places a white 37x30 rectangle at position (404, 38) then Draws a cyan circle centered at (147, 66) with radius 54 then Sets a single yellow pixel at (361, 52).
; PLAN: r0=404(x), r1=38(y), r2=37(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=147(x), r6=66(y), r7=54(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=361(x), r11=52(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 404
LDI r1, 38
LDI r2, 37
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 147
LDI r6, 66
LDI r7, 54
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 361
LDI r11, 52
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
