; DESCRIPTION: Composite: Creates a cyan circular shape at (178, 134) with radius 75 then Draws a yellow line from (282, 230) to (173, 145).
; PLAN: r0=178(x), r1=134(y), r2=75(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=282(x1), r6=230(y1), r7=173(x2), r8=145(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 178
LDI r1, 134
LDI r2, 75
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 282
LDI r6, 230
LDI r7, 173
LDI r8, 145
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
