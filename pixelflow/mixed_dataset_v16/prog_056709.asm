; DESCRIPTION: Composite: Places a yellow 32x72 rectangle at position (151, 171) then Places a white line segment connecting (348, 70) to (218, 253) then Places a purple circle of radius 31 at center (436, 128).
; PLAN: r0=151(x), r1=171(y), r2=32(width), r3=72(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x1), r6=70(y1), r7=218(x2), r8=253(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=436(x), r11=128(y), r12=31(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 151
LDI r1, 171
LDI r2, 32
LDI r3, 72
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 70
LDI r7, 218
LDI r8, 253
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 436
LDI r11, 128
LDI r12, 31
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
