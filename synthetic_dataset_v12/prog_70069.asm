; DESCRIPTION: Composite: Creates a magenta rectangular region at (13, 1) spanning 87 by 27 pixels then Sets a single red pixel at (304, 171) then Places a blue circle of radius 52 at center (458, 82).
; PLAN: r0=13(x), r1=1(y), r2=87(width), r3=27(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=304(x), r6=171(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=458(x), r11=82(y), r12=52(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 13
LDI r1, 1
LDI r2, 87
LDI r3, 27
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 304
LDI r6, 171
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 458
LDI r11, 82
LDI r12, 52
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
