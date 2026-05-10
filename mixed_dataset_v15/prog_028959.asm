; DESCRIPTION: Composite: Draws a black circle centered at (296, 177) with radius 73 then Draws a black line from (39, 66) to (488, 185) then Draws a blue rectangle at (271, 180) with width 86 and height 43.
; PLAN: r0=296(x), r1=177(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=39(x1), r6=66(y1), r7=488(x2), r8=185(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=271(x), r11=180(y), r12=86(width), r13=43(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 177
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 39
LDI r6, 66
LDI r7, 488
LDI r8, 185
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 271
LDI r11, 180
LDI r12, 86
LDI r13, 43
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
