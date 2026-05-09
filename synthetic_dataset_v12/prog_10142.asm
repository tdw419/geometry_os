; DESCRIPTION: Composite: Sets a single green pixel at (110, 67) then Draws a black circle centered at (293, 91) with radius 61 then Renders a cyan line between points (221, 6) and (148, 5).
; PLAN: r0=110(x), r1=67(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=293(x), r6=91(y), r7=61(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=221(x1), r11=6(y1), r12=148(x2), r13=5(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 67
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 293
LDI r6, 91
LDI r7, 61
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 221
LDI r11, 6
LDI r12, 148
LDI r13, 5
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
