; DESCRIPTION: Composite: Places a blue line segment connecting (121, 228) to (436, 161) then Creates a black circular shape at (126, 189) with radius 59.
; PLAN: r0=121(x1), r1=228(y1), r2=436(x2), r3=161(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=126(x), r6=189(y), r7=59(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 121
LDI r1, 228
LDI r2, 436
LDI r3, 161
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 126
LDI r6, 189
LDI r7, 59
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
