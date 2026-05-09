; DESCRIPTION: Composite: Renders a yellow line between points (342, 252) and (345, 24) then Renders a magenta box of size 17x100 starting at (29, 128) then Sets a single orange pixel at (288, 214).
; PLAN: r0=342(x1), r1=252(y1), r2=345(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=29(x), r6=128(y), r7=17(width), r8=100(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=288(x), r11=214(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 342
LDI r1, 252
LDI r2, 345
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 29
LDI r6, 128
LDI r7, 17
LDI r8, 100
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 288
LDI r11, 214
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
