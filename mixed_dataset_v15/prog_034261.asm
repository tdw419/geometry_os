; DESCRIPTION: Draws a purple circle at (128, 128) with radius 60 then a red line from (0, 0) to (255, 255).
; PLAN: r0=128(x1), r1=128(y1), r2=60(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=128(x1), r6=128(y), r7=255(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 128
LDI r1, 128
LDI r2, 60
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 128
LDI r6, 128
LDI r7, 255
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
