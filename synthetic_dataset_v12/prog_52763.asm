; DESCRIPTION: Composite: Places a orange 93x15 rectangle at position (384, 63) then Places a magenta dot at position (260, 198) then Renders a yellow line between points (249, 221) and (110, 30).
; PLAN: r0=384(x), r1=63(y), r2=93(width), r3=15(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=260(x), r6=198(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=249(x1), r11=221(y1), r12=110(x2), r13=30(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 63
LDI r2, 93
LDI r3, 15
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 260
LDI r6, 198
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 249
LDI r11, 221
LDI r12, 110
LDI r13, 30
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
