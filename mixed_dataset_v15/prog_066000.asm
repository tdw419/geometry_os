; DESCRIPTION: Composite: Renders a red disk with center (426, 98) and radius 20 then Places a magenta dot at position (156, 90) then Places a black line segment connecting (215, 186) to (397, 4).
; PLAN: r0=426(x), r1=98(y), r2=20(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=90(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=215(x1), r11=186(y1), r12=397(x2), r13=4(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 98
LDI r2, 20
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 90
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 186
LDI r12, 397
LDI r13, 4
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
