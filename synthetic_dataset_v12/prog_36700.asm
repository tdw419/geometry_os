; DESCRIPTION: Composite: Renders a red disk with center (397, 147) and radius 67 then Places a magenta line segment connecting (221, 210) to (337, 27) then Sets a single purple pixel at (305, 64).
; PLAN: r0=397(x), r1=147(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=221(x1), r6=210(y1), r7=337(x2), r8=27(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=305(x), r11=64(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 397
LDI r1, 147
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 221
LDI r6, 210
LDI r7, 337
LDI r8, 27
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 305
LDI r11, 64
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
