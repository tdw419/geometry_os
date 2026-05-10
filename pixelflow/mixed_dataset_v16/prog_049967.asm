; DESCRIPTION: Composite: Places a green 63x32 rectangle at position (133, 71) then Places a cyan line segment connecting (500, 65) to (374, 86) then Creates a red circular shape at (409, 121) with radius 40.
; PLAN: r0=133(x), r1=71(y), r2=63(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=500(x1), r6=65(y1), r7=374(x2), r8=86(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=409(x), r11=121(y), r12=40(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 133
LDI r1, 71
LDI r2, 63
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 500
LDI r6, 65
LDI r7, 374
LDI r8, 86
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 409
LDI r11, 121
LDI r12, 40
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
