; DESCRIPTION: Composite: Creates a purple circular shape at (144, 160) with radius 64 then Draws a red line from (74, 144) to (359, 195).
; PLAN: r0=144(x), r1=160(y), r2=64(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x1), r6=144(y1), r7=359(x2), r8=195(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 160
LDI r2, 64
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 144
LDI r7, 359
LDI r8, 195
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
