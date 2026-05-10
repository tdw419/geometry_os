; DESCRIPTION: Composite: Renders a green box of size 34x115 starting at (113, 46) then Sets a single purple pixel at (231, 194) then Creates a cyan circular shape at (371, 121) with radius 55.
; PLAN: r0=113(x), r1=46(y), r2=34(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=194(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=371(x), r11=121(y), r12=55(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 113
LDI r1, 46
LDI r2, 34
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 194
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 371
LDI r11, 121
LDI r12, 55
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
