; DESCRIPTION: Composite: Sets a single red pixel at (282, 115) then Renders a red disk with center (106, 212) and radius 42 then Places a red line segment connecting (492, 39) to (181, 153).
; PLAN: r0=282(x), r1=115(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=106(x), r6=212(y), r7=42(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=492(x1), r11=39(y1), r12=181(x2), r13=153(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 282
LDI r1, 115
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 106
LDI r6, 212
LDI r7, 42
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 492
LDI r11, 39
LDI r12, 181
LDI r13, 153
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
