; DESCRIPTION: Composite: Renders a green disk with center (397, 122) and radius 41 then Renders a blue box of size 115x97 starting at (295, 48) then Draws a purple line from (209, 168) to (210, 178).
; PLAN: r0=397(x), r1=122(y), r2=41(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x), r6=48(y), r7=115(width), r8=97(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=209(x1), r11=168(y1), r12=210(x2), r13=178(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 397
LDI r1, 122
LDI r2, 41
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 48
LDI r7, 115
LDI r8, 97
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 209
LDI r11, 168
LDI r12, 210
LDI r13, 178
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
