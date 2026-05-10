; DESCRIPTION: Composite: Draws a yellow line from (499, 96) to (107, 243) then Sets a single red pixel at (0, 236) then Draws a black rectangle at (23, 120) with width 31 and height 32.
; PLAN: r0=499(x1), r1=96(y1), r2=107(x2), r3=243(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=0(x), r6=236(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=23(x), r11=120(y), r12=31(width), r13=32(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 499
LDI r1, 96
LDI r2, 107
LDI r3, 243
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 0
LDI r6, 236
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 23
LDI r11, 120
LDI r12, 31
LDI r13, 32
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
