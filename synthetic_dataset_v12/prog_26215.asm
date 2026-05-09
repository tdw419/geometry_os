; DESCRIPTION: Composite: Places a white circle of radius 52 at center (357, 57) then Places a white dot at position (94, 38) then Renders a white line between points (46, 221) and (496, 43).
; PLAN: r0=357(x), r1=57(y), r2=52(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=94(x), r6=38(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=46(x1), r11=221(y1), r12=496(x2), r13=43(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 357
LDI r1, 57
LDI r2, 52
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 94
LDI r6, 38
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 46
LDI r11, 221
LDI r12, 496
LDI r13, 43
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
