; DESCRIPTION: Composite: Creates a magenta circular shape at (93, 80) with radius 42 then Sets a single purple pixel at (54, 2) then Renders a green box of size 79x99 starting at (140, 20).
; PLAN: r0=93(x), r1=80(y), r2=42(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=2(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=140(x), r11=20(y), r12=79(width), r13=99(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 93
LDI r1, 80
LDI r2, 42
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 2
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 140
LDI r11, 20
LDI r12, 79
LDI r13, 99
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
