; DESCRIPTION: Composite: Creates a blue circular shape at (448, 77) with radius 23 then Renders a cyan box of size 95x31 starting at (74, 133) then Renders a yellow line between points (172, 245) and (220, 87).
; PLAN: r0=448(x), r1=77(y), r2=23(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=74(x), r6=133(y), r7=95(width), r8=31(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=172(x1), r11=245(y1), r12=220(x2), r13=87(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 448
LDI r1, 77
LDI r2, 23
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 74
LDI r6, 133
LDI r7, 95
LDI r8, 31
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 172
LDI r11, 245
LDI r12, 220
LDI r13, 87
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
