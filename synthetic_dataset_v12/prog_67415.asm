; DESCRIPTION: Composite: Creates a red circular shape at (208, 216) with radius 37 then Places a cyan dot at position (464, 220) then Renders a magenta line between points (229, 49) and (286, 170).
; PLAN: r0=208(x), r1=216(y), r2=37(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=464(x), r6=220(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=229(x1), r11=49(y1), r12=286(x2), r13=170(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 208
LDI r1, 216
LDI r2, 37
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 464
LDI r6, 220
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 229
LDI r11, 49
LDI r12, 286
LDI r13, 170
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
