; DESCRIPTION: Composite: Places a yellow circle of radius 48 at center (100, 178) then Sets a single purple pixel at (435, 85) then Draws a cyan line from (42, 100) to (124, 12).
; PLAN: r0=100(x), r1=178(y), r2=48(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=435(x), r6=85(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=42(x1), r11=100(y1), r12=124(x2), r13=12(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 100
LDI r1, 178
LDI r2, 48
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 435
LDI r6, 85
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 42
LDI r11, 100
LDI r12, 124
LDI r13, 12
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
