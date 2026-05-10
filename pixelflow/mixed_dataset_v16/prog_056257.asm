; DESCRIPTION: Composite: Creates a black circular shape at (362, 174) with radius 57 then Draws a cyan line from (289, 236) to (227, 7) then Places a cyan 64x68 rectangle at position (70, 163).
; PLAN: r0=362(x), r1=174(y), r2=57(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=289(x1), r6=236(y1), r7=227(x2), r8=7(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=70(x), r11=163(y), r12=64(width), r13=68(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 362
LDI r1, 174
LDI r2, 57
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 289
LDI r6, 236
LDI r7, 227
LDI r8, 7
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 70
LDI r11, 163
LDI r12, 64
LDI r13, 68
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
