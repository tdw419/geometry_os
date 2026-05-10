; DESCRIPTION: Composite: Renders a white disk with center (337, 51) and radius 30 then Places a magenta line segment connecting (319, 79) to (4, 130) then Sets a single green pixel at (113, 194).
; PLAN: r0=337(x), r1=51(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x1), r6=79(y1), r7=4(x2), r8=130(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=113(x), r11=194(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 337
LDI r1, 51
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 79
LDI r7, 4
LDI r8, 130
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 113
LDI r11, 194
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
