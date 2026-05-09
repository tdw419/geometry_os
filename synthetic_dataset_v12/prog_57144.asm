; DESCRIPTION: Composite: Places a white line segment connecting (145, 45) to (224, 172) then Sets a single yellow pixel at (146, 52) then Places a purple 66x90 rectangle at position (425, 76).
; PLAN: r0=145(x1), r1=45(y1), r2=224(x2), r3=172(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=146(x), r6=52(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=425(x), r11=76(y), r12=66(width), r13=90(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 45
LDI r2, 224
LDI r3, 172
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 146
LDI r6, 52
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 425
LDI r11, 76
LDI r12, 66
LDI r13, 90
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
