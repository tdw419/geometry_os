; DESCRIPTION: Composite: Sets a single green pixel at (270, 78) then Renders a cyan box of size 13x54 starting at (177, 189) then Renders a black line between points (43, 79) and (325, 204).
; PLAN: r0=270(x), r1=78(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=177(x), r6=189(y), r7=13(width), r8=54(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=43(x1), r11=79(y1), r12=325(x2), r13=204(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 270
LDI r1, 78
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 177
LDI r6, 189
LDI r7, 13
LDI r8, 54
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 43
LDI r11, 79
LDI r12, 325
LDI r13, 204
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
