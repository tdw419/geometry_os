; DESCRIPTION: Composite: Sets a single magenta pixel at (435, 114) then Draws a green line from (211, 61) to (479, 114) then Draws a white circle centered at (156, 164) with radius 23.
; PLAN: r0=435(x), r1=114(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=211(x1), r6=61(y1), r7=479(x2), r8=114(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=156(x), r11=164(y), r12=23(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 435
LDI r1, 114
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 61
LDI r7, 479
LDI r8, 114
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 164
LDI r12, 23
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
