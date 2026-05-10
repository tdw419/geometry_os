; DESCRIPTION: Composite: Draws a black circle centered at (128, 175) with radius 67 then Places a cyan 113x27 rectangle at position (245, 179) then Draws a cyan line from (196, 160) to (195, 14).
; PLAN: r0=128(x), r1=175(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=245(x), r6=179(y), r7=113(width), r8=27(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=196(x1), r11=160(y1), r12=195(x2), r13=14(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 128
LDI r1, 175
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 245
LDI r6, 179
LDI r7, 113
LDI r8, 27
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 196
LDI r11, 160
LDI r12, 195
LDI r13, 14
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
