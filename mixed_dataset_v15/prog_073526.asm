; DESCRIPTION: Composite: Draws a red rectangle at (110, 12) with width 47 and height 64 then Places a blue dot at position (73, 134) then Draws a yellow line from (470, 66) to (301, 113).
; PLAN: r0=110(x), r1=12(y), r2=47(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=73(x), r6=134(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=470(x1), r11=66(y1), r12=301(x2), r13=113(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 110
LDI r1, 12
LDI r2, 47
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 73
LDI r6, 134
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 470
LDI r11, 66
LDI r12, 301
LDI r13, 113
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
