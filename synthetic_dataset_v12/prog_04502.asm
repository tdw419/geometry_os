; DESCRIPTION: Composite: Renders a blue line between points (415, 228) and (289, 81) then Places a red dot at position (452, 12) then Places a black circle of radius 16 at center (460, 189).
; PLAN: r0=415(x1), r1=228(y1), r2=289(x2), r3=81(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=452(x), r6=12(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=460(x), r11=189(y), r12=16(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 415
LDI r1, 228
LDI r2, 289
LDI r3, 81
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 452
LDI r6, 12
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 460
LDI r11, 189
LDI r12, 16
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
