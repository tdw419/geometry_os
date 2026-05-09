; DESCRIPTION: Composite: Renders a black line between points (315, 206) and (32, 180) then Draws a magenta circle centered at (422, 201) with radius 36 then Renders a blue box of size 72x47 starting at (46, 86).
; PLAN: r0=315(x1), r1=206(y1), r2=32(x2), r3=180(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=422(x), r6=201(y), r7=36(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=46(x), r11=86(y), r12=72(width), r13=47(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 315
LDI r1, 206
LDI r2, 32
LDI r3, 180
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 201
LDI r7, 36
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 46
LDI r11, 86
LDI r12, 72
LDI r13, 47
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
