; DESCRIPTION: Composite: Renders a black line between points (400, 56) and (445, 151) then Places a cyan circle of radius 65 at center (274, 65).
; PLAN: r0=400(x1), r1=56(y1), r2=445(x2), r3=151(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=274(x), r6=65(y), r7=65(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 400
LDI r1, 56
LDI r2, 445
LDI r3, 151
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 274
LDI r6, 65
LDI r7, 65
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
