; DESCRIPTION: Composite: Creates a purple circular shape at (299, 99) with radius 66 then Renders a yellow line between points (340, 16) and (208, 70) then Sets a single magenta pixel at (454, 8).
; PLAN: r0=299(x), r1=99(y), r2=66(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=340(x1), r6=16(y1), r7=208(x2), r8=70(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=454(x), r11=8(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 299
LDI r1, 99
LDI r2, 66
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 340
LDI r6, 16
LDI r7, 208
LDI r8, 70
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 454
LDI r11, 8
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
