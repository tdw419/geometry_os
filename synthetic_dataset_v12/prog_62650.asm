; DESCRIPTION: Composite: Draws a magenta line from (58, 175) to (54, 213) then Renders a cyan box of size 45x79 starting at (237, 8) then Places a white dot at position (198, 186).
; PLAN: r0=58(x1), r1=175(y1), r2=54(x2), r3=213(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=237(x), r6=8(y), r7=45(width), r8=79(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=198(x), r11=186(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 58
LDI r1, 175
LDI r2, 54
LDI r3, 213
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 237
LDI r6, 8
LDI r7, 45
LDI r8, 79
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 198
LDI r11, 186
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
