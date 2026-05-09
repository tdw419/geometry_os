; DESCRIPTION: Composite: Draws a yellow line from (196, 112) to (202, 22) then Renders a purple disk with center (466, 193) and radius 19 then Renders a purple box of size 103x46 starting at (256, 98).
; PLAN: r0=196(x1), r1=112(y1), r2=202(x2), r3=22(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=466(x), r6=193(y), r7=19(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=256(x), r11=98(y), r12=103(width), r13=46(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 196
LDI r1, 112
LDI r2, 202
LDI r3, 22
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 193
LDI r7, 19
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 256
LDI r11, 98
LDI r12, 103
LDI r13, 46
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
