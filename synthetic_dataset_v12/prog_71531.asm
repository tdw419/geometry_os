; DESCRIPTION: Composite: Renders a yellow line between points (266, 21) and (373, 129) then Draws a cyan circle centered at (310, 187) with radius 37.
; PLAN: r0=266(x1), r1=21(y1), r2=373(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=310(x), r6=187(y), r7=37(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 266
LDI r1, 21
LDI r2, 373
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 310
LDI r6, 187
LDI r7, 37
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
