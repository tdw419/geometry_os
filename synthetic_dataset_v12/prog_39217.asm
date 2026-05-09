; DESCRIPTION: Composite: Places a orange 87x33 rectangle at position (126, 25) then Places a red line segment connecting (27, 166) to (277, 185) then Places a cyan circle of radius 67 at center (220, 99).
; PLAN: r0=126(x), r1=25(y), r2=87(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x1), r6=166(y1), r7=277(x2), r8=185(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=220(x), r11=99(y), r12=67(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 126
LDI r1, 25
LDI r2, 87
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 166
LDI r7, 277
LDI r8, 185
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 220
LDI r11, 99
LDI r12, 67
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
