; DESCRIPTION: Composite: Places a white dot at position (362, 65) then Creates a yellow rectangular region at (368, 173) spanning 50 by 10 pixels then Creates a purple circular shape at (171, 137) with radius 32.
; PLAN: r0=362(x), r1=65(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=368(x), r6=173(y), r7=50(width), r8=10(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=171(x), r11=137(y), r12=32(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 362
LDI r1, 65
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 368
LDI r6, 173
LDI r7, 50
LDI r8, 10
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 171
LDI r11, 137
LDI r12, 32
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
