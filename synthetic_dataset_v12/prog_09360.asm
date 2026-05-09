; DESCRIPTION: Composite: Places a blue dot at position (25, 210) then Places a cyan circle of radius 11 at center (395, 242) then Draws a purple line from (353, 246) to (422, 2).
; PLAN: r0=25(x), r1=210(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=395(x), r6=242(y), r7=11(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=353(x1), r11=246(y1), r12=422(x2), r13=2(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 25
LDI r1, 210
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 395
LDI r6, 242
LDI r7, 11
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 353
LDI r11, 246
LDI r12, 422
LDI r13, 2
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
