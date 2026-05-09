; DESCRIPTION: Composite: Creates a green circular shape at (137, 161) with radius 53 then Renders a yellow line between points (12, 160) and (473, 40) then Sets a single magenta pixel at (76, 93).
; PLAN: r0=137(x), r1=161(y), r2=53(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=12(x1), r6=160(y1), r7=473(x2), r8=40(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=76(x), r11=93(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 137
LDI r1, 161
LDI r2, 53
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 12
LDI r6, 160
LDI r7, 473
LDI r8, 40
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 76
LDI r11, 93
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
