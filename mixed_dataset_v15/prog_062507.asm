; DESCRIPTION: Composite: Creates a blue circular shape at (41, 69) with radius 40 then Sets a single cyan pixel at (11, 197) then Places a orange line segment connecting (32, 79) to (236, 187).
; PLAN: r0=41(x), r1=69(y), r2=40(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x), r6=197(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=32(x1), r11=79(y1), r12=236(x2), r13=187(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 41
LDI r1, 69
LDI r2, 40
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 197
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 32
LDI r11, 79
LDI r12, 236
LDI r13, 187
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
