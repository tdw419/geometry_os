; DESCRIPTION: Composite: Draws a yellow circle centered at (356, 143) with radius 72 then Places a cyan line segment connecting (338, 173) to (21, 74).
; PLAN: r0=356(x), r1=143(y), r2=72(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=338(x1), r6=173(y1), r7=21(x2), r8=74(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 143
LDI r2, 72
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 338
LDI r6, 173
LDI r7, 21
LDI r8, 74
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
