; DESCRIPTION: Composite: Places a white dot at position (370, 64) then Renders a green box of size 73x94 starting at (387, 95) then Draws a magenta line from (493, 211) to (132, 232).
; PLAN: r0=370(x), r1=64(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=387(x), r6=95(y), r7=73(width), r8=94(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=493(x1), r11=211(y1), r12=132(x2), r13=232(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 370
LDI r1, 64
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 387
LDI r6, 95
LDI r7, 73
LDI r8, 94
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 493
LDI r11, 211
LDI r12, 132
LDI r13, 232
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
