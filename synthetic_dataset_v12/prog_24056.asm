; DESCRIPTION: Composite: Renders a green disk with center (11, 225) and radius 11 then Renders a magenta line between points (21, 45) and (346, 237) then Places a black dot at position (199, 59).
; PLAN: r0=11(x), r1=225(y), r2=11(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=21(x1), r6=45(y1), r7=346(x2), r8=237(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=199(x), r11=59(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 11
LDI r1, 225
LDI r2, 11
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 21
LDI r6, 45
LDI r7, 346
LDI r8, 237
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 199
LDI r11, 59
LDI r12, 0x000000
PSET r10, r11, r12
HALT
