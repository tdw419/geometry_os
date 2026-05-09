; DESCRIPTION: Composite: Places a purple dot at position (338, 7) then Places a cyan circle of radius 42 at center (79, 132) then Places a yellow 83x94 rectangle at position (277, 154).
; PLAN: r0=338(x), r1=7(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=79(x), r6=132(y), r7=42(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=277(x), r11=154(y), r12=83(width), r13=94(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 338
LDI r1, 7
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 79
LDI r6, 132
LDI r7, 42
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 277
LDI r11, 154
LDI r12, 83
LDI r13, 94
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
