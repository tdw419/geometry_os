; DESCRIPTION: Composite: Places a black circle of radius 11 at center (113, 59) then Renders a black line between points (208, 198) and (177, 239).
; PLAN: r0=113(x), r1=59(y), r2=11(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=208(x1), r6=198(y1), r7=177(x2), r8=239(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 113
LDI r1, 59
LDI r2, 11
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 208
LDI r6, 198
LDI r7, 177
LDI r8, 239
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
