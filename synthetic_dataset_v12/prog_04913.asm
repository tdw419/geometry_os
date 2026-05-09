; DESCRIPTION: Composite: Renders a magenta box of size 89x81 starting at (255, 44) then Sets a single magenta pixel at (55, 242) then Places a green line segment connecting (154, 176) to (324, 183).
; PLAN: r0=255(x), r1=44(y), r2=89(width), r3=81(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=55(x), r6=242(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=154(x1), r11=176(y1), r12=324(x2), r13=183(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 255
LDI r1, 44
LDI r2, 89
LDI r3, 81
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 55
LDI r6, 242
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 154
LDI r11, 176
LDI r12, 324
LDI r13, 183
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
