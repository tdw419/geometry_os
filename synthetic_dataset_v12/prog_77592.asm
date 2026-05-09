; DESCRIPTION: Composite: Places a purple circle of radius 57 at center (339, 166) then Draws a cyan rectangle at (368, 196) with width 63 and height 42 then Places a cyan line segment connecting (180, 66) to (337, 206).
; PLAN: r0=339(x), r1=166(y), r2=57(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=368(x), r6=196(y), r7=63(width), r8=42(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=180(x1), r11=66(y1), r12=337(x2), r13=206(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 166
LDI r2, 57
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 368
LDI r6, 196
LDI r7, 63
LDI r8, 42
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 180
LDI r11, 66
LDI r12, 337
LDI r13, 206
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
