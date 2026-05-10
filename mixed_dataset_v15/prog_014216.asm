; DESCRIPTION: Composite: Draws a orange rectangle at (237, 71) with width 49 and height 78 then Places a magenta dot at position (150, 162) then Draws a purple line from (295, 21) to (243, 142).
; PLAN: r0=237(x), r1=71(y), r2=49(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x), r6=162(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=295(x1), r11=21(y1), r12=243(x2), r13=142(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 237
LDI r1, 71
LDI r2, 49
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 162
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 295
LDI r11, 21
LDI r12, 243
LDI r13, 142
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
