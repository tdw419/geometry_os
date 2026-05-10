; DESCRIPTION: Composite: Renders a red disk with center (279, 167) and radius 21 then Places a cyan dot at position (9, 31) then Places a purple line segment connecting (337, 5) to (54, 102).
; PLAN: r0=279(x), r1=167(y), r2=21(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x), r6=31(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=337(x1), r11=5(y1), r12=54(x2), r13=102(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 279
LDI r1, 167
LDI r2, 21
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 31
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 337
LDI r11, 5
LDI r12, 54
LDI r13, 102
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
