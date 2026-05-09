; DESCRIPTION: Composite: Renders a white line between points (460, 246) and (319, 231) then Places a blue circle of radius 11 at center (143, 209).
; PLAN: r0=460(x1), r1=246(y1), r2=319(x2), r3=231(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=143(x), r6=209(y), r7=11(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 460
LDI r1, 246
LDI r2, 319
LDI r3, 231
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 143
LDI r6, 209
LDI r7, 11
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
