; DESCRIPTION: Composite: Sets a single magenta pixel at (354, 37) then Renders a black box of size 93x12 starting at (129, 60) then Renders a magenta line between points (62, 234) and (197, 140).
; PLAN: r0=354(x), r1=37(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=129(x), r6=60(y), r7=93(width), r8=12(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=62(x1), r11=234(y1), r12=197(x2), r13=140(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 354
LDI r1, 37
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 129
LDI r6, 60
LDI r7, 93
LDI r8, 12
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 62
LDI r11, 234
LDI r12, 197
LDI r13, 140
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
