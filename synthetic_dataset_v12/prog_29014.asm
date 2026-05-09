; DESCRIPTION: Composite: Creates a blue circular shape at (391, 125) with radius 76 then Renders a green line between points (435, 129) and (418, 147) then Sets a single black pixel at (209, 3).
; PLAN: r0=391(x), r1=125(y), r2=76(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x1), r6=129(y1), r7=418(x2), r8=147(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=209(x), r11=3(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 391
LDI r1, 125
LDI r2, 76
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 129
LDI r7, 418
LDI r8, 147
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 3
LDI r12, 0x000000
PSET r10, r11, r12
HALT
