; DESCRIPTION: Composite: Places a orange 104x73 rectangle at position (329, 128) then Draws a cyan line from (239, 74) to (196, 9) then Places a red circle of radius 15 at center (350, 125).
; PLAN: r0=329(x), r1=128(y), r2=104(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=239(x1), r6=74(y1), r7=196(x2), r8=9(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=350(x), r11=125(y), r12=15(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 329
LDI r1, 128
LDI r2, 104
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 239
LDI r6, 74
LDI r7, 196
LDI r8, 9
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 350
LDI r11, 125
LDI r12, 15
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
