; DESCRIPTION: Composite: Renders a magenta line between points (410, 40) and (28, 203) then Places a green dot at position (493, 28) then Creates a blue circular shape at (420, 202) with radius 48.
; PLAN: r0=410(x1), r1=40(y1), r2=28(x2), r3=203(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=493(x), r6=28(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=420(x), r11=202(y), r12=48(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 410
LDI r1, 40
LDI r2, 28
LDI r3, 203
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 493
LDI r6, 28
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 420
LDI r11, 202
LDI r12, 48
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
