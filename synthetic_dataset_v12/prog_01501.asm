; DESCRIPTION: Composite: Places a red circle of radius 71 at center (436, 154) then Sets a single cyan pixel at (431, 219) then Renders a green box of size 60x92 starting at (143, 46).
; PLAN: r0=436(x), r1=154(y), r2=71(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=431(x), r6=219(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=143(x), r11=46(y), r12=60(width), r13=92(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 154
LDI r2, 71
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 431
LDI r6, 219
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 143
LDI r11, 46
LDI r12, 60
LDI r13, 92
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
