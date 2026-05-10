; DESCRIPTION: Composite: Places a yellow 64x29 rectangle at position (154, 9) then Sets a single green pixel at (62, 191) then Draws a orange line from (173, 177) to (228, 60).
; PLAN: r0=154(x), r1=9(y), r2=64(width), r3=29(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=62(x), r6=191(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=173(x1), r11=177(y1), r12=228(x2), r13=60(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 154
LDI r1, 9
LDI r2, 64
LDI r3, 29
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 62
LDI r6, 191
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 173
LDI r11, 177
LDI r12, 228
LDI r13, 60
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
