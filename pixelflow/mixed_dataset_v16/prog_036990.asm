; DESCRIPTION: Composite: Renders a red disk with center (219, 143) and radius 24 then Places a green dot at position (156, 153) then Renders a green line between points (413, 3) and (510, 11).
; PLAN: r0=219(x), r1=143(y), r2=24(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=153(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=413(x1), r11=3(y1), r12=510(x2), r13=11(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 219
LDI r1, 143
LDI r2, 24
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 153
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 413
LDI r11, 3
LDI r12, 510
LDI r13, 11
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
