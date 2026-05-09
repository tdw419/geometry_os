; DESCRIPTION: Composite: Renders a magenta disk with center (280, 71) and radius 13 then Places a cyan dot at position (257, 163) then Draws a red line from (212, 49) to (360, 162).
; PLAN: r0=280(x), r1=71(y), r2=13(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=163(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=212(x1), r11=49(y1), r12=360(x2), r13=162(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 280
LDI r1, 71
LDI r2, 13
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 163
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 212
LDI r11, 49
LDI r12, 360
LDI r13, 162
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
