; DESCRIPTION: Composite: Draws a blue line from (294, 33) to (13, 249) then Places a yellow circle of radius 18 at center (343, 211).
; PLAN: r0=294(x1), r1=33(y1), r2=13(x2), r3=249(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=211(y), r7=18(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 294
LDI r1, 33
LDI r2, 13
LDI r3, 249
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 211
LDI r7, 18
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
