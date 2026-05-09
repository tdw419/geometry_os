; DESCRIPTION: Composite: Places a white 50x32 rectangle at position (316, 223) then Places a black dot at position (386, 117) then Places a magenta line segment connecting (441, 255) to (63, 210).
; PLAN: r0=316(x), r1=223(y), r2=50(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=386(x), r6=117(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=441(x1), r11=255(y1), r12=63(x2), r13=210(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 223
LDI r2, 50
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 386
LDI r6, 117
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 441
LDI r11, 255
LDI r12, 63
LDI r13, 210
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
