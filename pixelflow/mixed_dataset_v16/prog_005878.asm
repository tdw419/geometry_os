; DESCRIPTION: Composite: Places a yellow dot at position (197, 148) then Creates a cyan circular shape at (195, 158) with radius 61 then Places a white line segment connecting (423, 127) to (220, 210).
; PLAN: r0=197(x), r1=148(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=195(x), r6=158(y), r7=61(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=423(x1), r11=127(y1), r12=220(x2), r13=210(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 197
LDI r1, 148
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 195
LDI r6, 158
LDI r7, 61
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 423
LDI r11, 127
LDI r12, 220
LDI r13, 210
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
