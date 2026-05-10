; DESCRIPTION: Composite: Places a yellow line segment connecting (298, 89) to (342, 85) then Places a magenta dot at position (255, 58) then Places a green 103x92 rectangle at position (349, 62).
; PLAN: r0=298(x1), r1=89(y1), r2=342(x2), r3=85(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=58(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=349(x), r11=62(y), r12=103(width), r13=92(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 298
LDI r1, 89
LDI r2, 342
LDI r3, 85
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 58
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 349
LDI r11, 62
LDI r12, 103
LDI r13, 92
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
