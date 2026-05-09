; DESCRIPTION: Composite: Renders a green disk with center (346, 42) and radius 42 then Sets a single green pixel at (111, 153) then Places a orange line segment connecting (292, 98) to (117, 56).
; PLAN: r0=346(x), r1=42(y), r2=42(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=111(x), r6=153(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=292(x1), r11=98(y1), r12=117(x2), r13=56(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 346
LDI r1, 42
LDI r2, 42
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 111
LDI r6, 153
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 292
LDI r11, 98
LDI r12, 117
LDI r13, 56
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
