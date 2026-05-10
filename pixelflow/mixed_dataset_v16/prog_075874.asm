; DESCRIPTION: Composite: Draws a cyan line from (243, 11) to (430, 164) then Draws a white circle centered at (149, 112) with radius 10 then Renders a yellow box of size 63x15 starting at (176, 20).
; PLAN: r0=243(x1), r1=11(y1), r2=430(x2), r3=164(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=149(x), r6=112(y), r7=10(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=176(x), r11=20(y), r12=63(width), r13=15(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 243
LDI r1, 11
LDI r2, 430
LDI r3, 164
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 149
LDI r6, 112
LDI r7, 10
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 176
LDI r11, 20
LDI r12, 63
LDI r13, 15
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
