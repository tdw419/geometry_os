; DESCRIPTION: Composite: . Then Places a green dot at position (188, 55). Then Places a purple circle of radius 53 at center (147, 154).
; PLAN: r0=188(x), r1=55(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r0=147(x), r1=154(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Places a green dot at position (188, 55).
; PLAN: r0=188(x), r1=55(y), r2=0x00FF00(color). Op: PSET r0, r1, r2.
LDI r0, 188
LDI r1, 55
LDI r2, 0x00FF00
PSET r0, r1, r2
; DESCRIPTION: Places a purple circle of radius 53 at center (147, 154).
; PLAN: r0=147(x), r1=154(y), r2=53(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 147
LDI r1, 154
LDI r2, 53
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
HALT
