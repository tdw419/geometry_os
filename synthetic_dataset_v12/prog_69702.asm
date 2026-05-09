; DESCRIPTION: Composite: Renders a green box of size 76x45 starting at (32, 13) then Places a blue dot at position (60, 182) then Renders a purple line between points (16, 218) and (128, 62).
; PLAN: r0=32(x), r1=13(y), r2=76(width), r3=45(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x), r6=182(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=16(x1), r11=218(y1), r12=128(x2), r13=62(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 32
LDI r1, 13
LDI r2, 76
LDI r3, 45
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 182
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 16
LDI r11, 218
LDI r12, 128
LDI r13, 62
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
