; DESCRIPTION: Composite: Renders a black disk with center (403, 180) and radius 67 then Places a magenta line segment connecting (24, 53) to (141, 173) then Sets a single black pixel at (406, 242).
; PLAN: r0=403(x), r1=180(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=24(x1), r6=53(y1), r7=141(x2), r8=173(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=406(x), r11=242(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 403
LDI r1, 180
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 24
LDI r6, 53
LDI r7, 141
LDI r8, 173
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 406
LDI r11, 242
LDI r12, 0x000000
PSET r10, r11, r12
HALT
