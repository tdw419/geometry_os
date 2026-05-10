; DESCRIPTION: Composite: Creates a cyan rectangular region at (15, 15) spanning 112 by 51 pixels then Places a black dot at position (195, 90) then Places a cyan line segment connecting (255, 20) to (310, 147).
; PLAN: r0=15(x), r1=15(y), r2=112(width), r3=51(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=195(x), r6=90(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=255(x1), r11=20(y1), r12=310(x2), r13=147(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 15
LDI r1, 15
LDI r2, 112
LDI r3, 51
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 195
LDI r6, 90
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 255
LDI r11, 20
LDI r12, 310
LDI r13, 147
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
