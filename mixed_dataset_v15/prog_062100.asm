; DESCRIPTION: Composite: Places a orange line segment connecting (480, 143) to (387, 74) then Renders a purple disk with center (128, 172) and radius 65.
; PLAN: r0=480(x1), r1=143(y1), r2=387(x2), r3=74(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=128(x), r6=172(y), r7=65(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 480
LDI r1, 143
LDI r2, 387
LDI r3, 74
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 128
LDI r6, 172
LDI r7, 65
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
