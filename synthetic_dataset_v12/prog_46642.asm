; DESCRIPTION: Composite: Places a orange circle of radius 66 at center (317, 157) then Sets a single magenta pixel at (275, 144) then Places a yellow 82x104 rectangle at position (250, 120).
; PLAN: r0=317(x), r1=157(y), r2=66(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=275(x), r6=144(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=250(x), r11=120(y), r12=82(width), r13=104(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 157
LDI r2, 66
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 275
LDI r6, 144
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 250
LDI r11, 120
LDI r12, 82
LDI r13, 104
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
