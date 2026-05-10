; DESCRIPTION: Composite: Places a purple circle of radius 42 at center (270, 191) then Renders a yellow line between points (459, 90) and (66, 171) then Places a green dot at position (242, 117).
; PLAN: r0=270(x), r1=191(y), r2=42(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=459(x1), r6=90(y1), r7=66(x2), r8=171(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=242(x), r11=117(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 270
LDI r1, 191
LDI r2, 42
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 459
LDI r6, 90
LDI r7, 66
LDI r8, 171
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 242
LDI r11, 117
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
