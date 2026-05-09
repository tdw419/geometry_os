; DESCRIPTION: Composite: Draws a black line from (505, 120) to (362, 231) then Renders a cyan disk with center (281, 218) and radius 36 then Places a yellow 88x101 rectangle at position (311, 70).
; PLAN: r0=505(x1), r1=120(y1), r2=362(x2), r3=231(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=281(x), r6=218(y), r7=36(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=311(x), r11=70(y), r12=88(width), r13=101(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 505
LDI r1, 120
LDI r2, 362
LDI r3, 231
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 281
LDI r6, 218
LDI r7, 36
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 311
LDI r11, 70
LDI r12, 88
LDI r13, 101
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
