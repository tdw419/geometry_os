; DESCRIPTION: Composite: Renders a purple box of size 120x38 starting at (56, 90) then Sets a single red pixel at (423, 175) then Places a cyan line segment connecting (178, 217) to (434, 173).
; PLAN: r0=56(x), r1=90(y), r2=120(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=423(x), r6=175(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=178(x1), r11=217(y1), r12=434(x2), r13=173(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 56
LDI r1, 90
LDI r2, 120
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 423
LDI r6, 175
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 178
LDI r11, 217
LDI r12, 434
LDI r13, 173
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
