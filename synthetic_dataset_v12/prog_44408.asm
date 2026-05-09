; DESCRIPTION: Composite: Places a blue circle of radius 11 at center (240, 176) then Places a magenta line segment connecting (26, 225) to (460, 37).
; PLAN: r0=240(x), r1=176(y), r2=11(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=26(x1), r6=225(y1), r7=460(x2), r8=37(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 240
LDI r1, 176
LDI r2, 11
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 26
LDI r6, 225
LDI r7, 460
LDI r8, 37
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
