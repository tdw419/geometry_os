; DESCRIPTION: Composite: Places a orange circle of radius 77 at center (249, 171) then Places a cyan 115x66 rectangle at position (324, 124) then Places a yellow line segment connecting (228, 240) to (389, 148).
; PLAN: r0=249(x), r1=171(y), r2=77(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=324(x), r6=124(y), r7=115(width), r8=66(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=228(x1), r11=240(y1), r12=389(x2), r13=148(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 249
LDI r1, 171
LDI r2, 77
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 324
LDI r6, 124
LDI r7, 115
LDI r8, 66
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 228
LDI r11, 240
LDI r12, 389
LDI r13, 148
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
