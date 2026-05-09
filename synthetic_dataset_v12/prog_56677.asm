; DESCRIPTION: Composite: Places a black circle of radius 16 at center (278, 190) then Places a red dot at position (433, 206) then Renders a magenta line between points (465, 21) and (417, 69).
; PLAN: r0=278(x), r1=190(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=433(x), r6=206(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=465(x1), r11=21(y1), r12=417(x2), r13=69(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 278
LDI r1, 190
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 433
LDI r6, 206
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 465
LDI r11, 21
LDI r12, 417
LDI r13, 69
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
