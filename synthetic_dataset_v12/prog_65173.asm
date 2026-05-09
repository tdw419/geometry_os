; DESCRIPTION: Composite: Draws a black line from (410, 55) to (482, 63) then Creates a blue circular shape at (449, 125) with radius 22.
; PLAN: r0=410(x1), r1=55(y1), r2=482(x2), r3=63(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=449(x), r6=125(y), r7=22(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 410
LDI r1, 55
LDI r2, 482
LDI r3, 63
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 449
LDI r6, 125
LDI r7, 22
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
