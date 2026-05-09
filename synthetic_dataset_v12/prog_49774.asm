; DESCRIPTION: Composite: Places a purple circle of radius 63 at center (330, 160) then Places a cyan 50x71 rectangle at position (220, 23) then Draws a red line from (178, 96) to (508, 21).
; PLAN: r0=330(x), r1=160(y), r2=63(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=220(x), r6=23(y), r7=50(width), r8=71(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=178(x1), r11=96(y1), r12=508(x2), r13=21(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 330
LDI r1, 160
LDI r2, 63
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 220
LDI r6, 23
LDI r7, 50
LDI r8, 71
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 178
LDI r11, 96
LDI r12, 508
LDI r13, 21
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
