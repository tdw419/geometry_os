; DESCRIPTION: Composite: Renders a black line between points (511, 53) and (499, 124) then Places a red circle of radius 64 at center (170, 154).
; PLAN: r0=511(x1), r1=53(y1), r2=499(x2), r3=124(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=170(x), r6=154(y), r7=64(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 511
LDI r1, 53
LDI r2, 499
LDI r3, 124
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 170
LDI r6, 154
LDI r7, 64
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
