; DESCRIPTION: Composite: Sets a single red pixel at (320, 156) then Places a blue circle of radius 61 at center (263, 79) then Places a white line segment connecting (267, 54) to (482, 8).
; PLAN: r0=320(x), r1=156(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=263(x), r6=79(y), r7=61(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=267(x1), r11=54(y1), r12=482(x2), r13=8(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 320
LDI r1, 156
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 263
LDI r6, 79
LDI r7, 61
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 267
LDI r11, 54
LDI r12, 482
LDI r13, 8
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
