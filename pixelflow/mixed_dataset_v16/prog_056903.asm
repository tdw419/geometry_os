; DESCRIPTION: Composite: Draws a black line from (405, 193) to (219, 161) then Draws a cyan circle centered at (270, 107) with radius 77 then Draws a blue rectangle at (68, 133) with width 66 and height 86.
; PLAN: r0=405(x1), r1=193(y1), r2=219(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=270(x), r6=107(y), r7=77(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x), r11=133(y), r12=66(width), r13=86(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 405
LDI r1, 193
LDI r2, 219
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 270
LDI r6, 107
LDI r7, 77
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 133
LDI r12, 66
LDI r13, 86
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
