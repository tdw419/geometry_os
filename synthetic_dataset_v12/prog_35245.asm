; DESCRIPTION: Composite: Sets a single green pixel at (181, 164) then Places a black 95x112 rectangle at position (201, 84) then Renders a black line between points (183, 194) and (456, 103).
; PLAN: r0=181(x), r1=164(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=201(x), r6=84(y), r7=95(width), r8=112(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=183(x1), r11=194(y1), r12=456(x2), r13=103(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 181
LDI r1, 164
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 201
LDI r6, 84
LDI r7, 95
LDI r8, 112
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 183
LDI r11, 194
LDI r12, 456
LDI r13, 103
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
