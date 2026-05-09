; DESCRIPTION: Composite: Renders a magenta line between points (190, 22) and (42, 126) then Places a green dot at position (455, 16) then Renders a white disk with center (362, 182) and radius 74.
; PLAN: r0=190(x1), r1=22(y1), r2=42(x2), r3=126(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=455(x), r6=16(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=362(x), r11=182(y), r12=74(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 190
LDI r1, 22
LDI r2, 42
LDI r3, 126
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 455
LDI r6, 16
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 362
LDI r11, 182
LDI r12, 74
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
