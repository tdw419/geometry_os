; DESCRIPTION: Composite: Draws a cyan rectangle at (198, 8) with width 59 and height 12 then Sets a single magenta pixel at (232, 108) then Draws a magenta line from (165, 208) to (266, 28).
; PLAN: r0=198(x), r1=8(y), r2=59(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=232(x), r6=108(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=165(x1), r11=208(y1), r12=266(x2), r13=28(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 8
LDI r2, 59
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 232
LDI r6, 108
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 165
LDI r11, 208
LDI r12, 266
LDI r13, 28
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
