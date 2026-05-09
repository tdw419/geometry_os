; DESCRIPTION: Composite: Renders a green line between points (317, 0) and (57, 67) then Places a black circle of radius 43 at center (55, 92).
; PLAN: r0=317(x1), r1=0(y1), r2=57(x2), r3=67(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=55(x), r6=92(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 317
LDI r1, 0
LDI r2, 57
LDI r3, 67
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 92
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
