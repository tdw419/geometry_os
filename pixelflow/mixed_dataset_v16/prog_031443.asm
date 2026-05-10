; DESCRIPTION: Composite: Draws a magenta circle centered at (409, 68) with radius 24 then Places a magenta dot at position (248, 215) then Draws a orange line from (80, 96) to (72, 130).
; PLAN: r0=409(x), r1=68(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=248(x), r6=215(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=80(x1), r11=96(y1), r12=72(x2), r13=130(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 409
LDI r1, 68
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 248
LDI r6, 215
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 80
LDI r11, 96
LDI r12, 72
LDI r13, 130
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
