; DESCRIPTION: Composite: Draws a magenta circle centered at (83, 171) with radius 61 then Draws a purple line from (403, 81) to (215, 13) then Renders a blue box of size 73x40 starting at (37, 160).
; PLAN: r0=83(x), r1=171(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=403(x1), r6=81(y1), r7=215(x2), r8=13(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=37(x), r11=160(y), r12=73(width), r13=40(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 83
LDI r1, 171
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 403
LDI r6, 81
LDI r7, 215
LDI r8, 13
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 37
LDI r11, 160
LDI r12, 73
LDI r13, 40
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
