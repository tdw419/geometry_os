; DESCRIPTION: Composite: Renders a black line between points (274, 39) and (433, 156) then Places a cyan circle of radius 74 at center (148, 88).
; PLAN: r0=274(x1), r1=39(y1), r2=433(x2), r3=156(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=88(y), r7=74(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 274
LDI r1, 39
LDI r2, 433
LDI r3, 156
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 88
LDI r7, 74
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
