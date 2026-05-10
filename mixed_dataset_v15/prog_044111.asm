; DESCRIPTION: Composite: Places a magenta line segment connecting (293, 182) to (56, 107) then Places a purple 80x40 rectangle at position (271, 185) then Places a red dot at position (354, 137).
; PLAN: r0=293(x1), r1=182(y1), r2=56(x2), r3=107(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=185(y), r7=80(width), r8=40(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=354(x), r11=137(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 293
LDI r1, 182
LDI r2, 56
LDI r3, 107
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 185
LDI r7, 80
LDI r8, 40
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 354
LDI r11, 137
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
