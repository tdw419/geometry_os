; DESCRIPTION: Composite: Creates a green circular shape at (225, 43) with radius 39 then Places a cyan dot at position (292, 171) then Places a magenta line segment connecting (365, 115) to (131, 97).
; PLAN: r0=225(x), r1=43(y), r2=39(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=292(x), r6=171(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=365(x1), r11=115(y1), r12=131(x2), r13=97(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 225
LDI r1, 43
LDI r2, 39
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 292
LDI r6, 171
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 365
LDI r11, 115
LDI r12, 131
LDI r13, 97
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
