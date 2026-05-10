; DESCRIPTION: Composite: Draws a yellow line from (49, 75) to (169, 196) then Places a black circle of radius 51 at center (135, 193).
; PLAN: r0=49(x1), r1=75(y1), r2=169(x2), r3=196(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=135(x), r6=193(y), r7=51(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 49
LDI r1, 75
LDI r2, 169
LDI r3, 196
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 135
LDI r6, 193
LDI r7, 51
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
