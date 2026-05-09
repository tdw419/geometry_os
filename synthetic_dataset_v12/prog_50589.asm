; DESCRIPTION: Composite: Places a red 32x35 rectangle at position (283, 98) then Draws a orange circle centered at (106, 87) with radius 57 then Draws a magenta line from (356, 14) to (425, 131).
; PLAN: r0=283(x), r1=98(y), r2=32(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=106(x), r6=87(y), r7=57(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=356(x1), r11=14(y1), r12=425(x2), r13=131(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 283
LDI r1, 98
LDI r2, 32
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 106
LDI r6, 87
LDI r7, 57
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 356
LDI r11, 14
LDI r12, 425
LDI r13, 131
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
