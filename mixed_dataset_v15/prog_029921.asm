; DESCRIPTION: Composite: Places a orange line segment connecting (271, 10) to (176, 127) then Places a yellow circle of radius 53 at center (167, 103) then Sets a single red pixel at (409, 91).
; PLAN: r0=271(x1), r1=10(y1), r2=176(x2), r3=127(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=167(x), r6=103(y), r7=53(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=409(x), r11=91(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 271
LDI r1, 10
LDI r2, 176
LDI r3, 127
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 167
LDI r6, 103
LDI r7, 53
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 409
LDI r11, 91
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
