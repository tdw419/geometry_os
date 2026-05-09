; DESCRIPTION: Composite: Sets a single orange pixel at (467, 20) then Creates a purple circular shape at (82, 143) with radius 27 then Draws a blue line from (13, 33) to (210, 162).
; PLAN: r0=467(x), r1=20(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=82(x), r6=143(y), r7=27(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=13(x1), r11=33(y1), r12=210(x2), r13=162(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 467
LDI r1, 20
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 82
LDI r6, 143
LDI r7, 27
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 13
LDI r11, 33
LDI r12, 210
LDI r13, 162
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
