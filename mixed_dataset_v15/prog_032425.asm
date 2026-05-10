; DESCRIPTION: Composite: Places a black circle of radius 48 at center (313, 152) then Sets a single green pixel at (22, 209) then Renders a magenta box of size 68x57 starting at (319, 8).
; PLAN: r0=313(x), r1=152(y), r2=48(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=22(x), r6=209(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=319(x), r11=8(y), r12=68(width), r13=57(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 313
LDI r1, 152
LDI r2, 48
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 22
LDI r6, 209
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 319
LDI r11, 8
LDI r12, 68
LDI r13, 57
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
