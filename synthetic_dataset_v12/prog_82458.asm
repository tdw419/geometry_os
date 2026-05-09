; DESCRIPTION: Composite: Places a red circle of radius 27 at center (226, 224) then Places a yellow line segment connecting (78, 238) to (323, 173) then Places a magenta dot at position (250, 170).
; PLAN: r0=226(x), r1=224(y), r2=27(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=78(x1), r6=238(y1), r7=323(x2), r8=173(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=250(x), r11=170(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 226
LDI r1, 224
LDI r2, 27
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 78
LDI r6, 238
LDI r7, 323
LDI r8, 173
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 170
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
