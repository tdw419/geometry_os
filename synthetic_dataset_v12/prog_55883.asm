; DESCRIPTION: Composite: Places a yellow line segment connecting (52, 13) to (385, 37) then Places a blue circle of radius 50 at center (449, 52).
; PLAN: r0=52(x1), r1=13(y1), r2=385(x2), r3=37(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=52(y), r7=50(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 52
LDI r1, 13
LDI r2, 385
LDI r3, 37
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 52
LDI r7, 50
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
