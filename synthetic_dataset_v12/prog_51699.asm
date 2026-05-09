; DESCRIPTION: Composite: Places a blue 97x21 rectangle at position (335, 56) then Renders a blue line between points (16, 178) and (348, 239) then Sets a single yellow pixel at (474, 144).
; PLAN: r0=335(x), r1=56(y), r2=97(width), r3=21(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=16(x1), r6=178(y1), r7=348(x2), r8=239(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=474(x), r11=144(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 335
LDI r1, 56
LDI r2, 97
LDI r3, 21
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 16
LDI r6, 178
LDI r7, 348
LDI r8, 239
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 474
LDI r11, 144
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
