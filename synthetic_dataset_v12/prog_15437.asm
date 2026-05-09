; DESCRIPTION: Composite: Renders a blue line between points (69, 191) and (405, 3) then Places a purple circle of radius 30 at center (350, 71).
; PLAN: r0=69(x1), r1=191(y1), r2=405(x2), r3=3(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=350(x), r6=71(y), r7=30(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 69
LDI r1, 191
LDI r2, 405
LDI r3, 3
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 350
LDI r6, 71
LDI r7, 30
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
