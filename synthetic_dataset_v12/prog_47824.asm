; DESCRIPTION: Composite: Places a cyan circle of radius 18 at center (88, 121) then Sets a single cyan pixel at (441, 63) then Renders a magenta line between points (216, 204) and (12, 61).
; PLAN: r0=88(x), r1=121(y), r2=18(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=441(x), r6=63(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=216(x1), r11=204(y1), r12=12(x2), r13=61(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 88
LDI r1, 121
LDI r2, 18
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 441
LDI r6, 63
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 216
LDI r11, 204
LDI r12, 12
LDI r13, 61
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
