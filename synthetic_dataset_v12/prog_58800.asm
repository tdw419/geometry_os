; DESCRIPTION: Composite: Places a red line segment connecting (123, 65) to (304, 168) then Sets a single purple pixel at (246, 37) then Creates a green rectangular region at (215, 200) spanning 100 by 38 pixels.
; PLAN: r0=123(x1), r1=65(y1), r2=304(x2), r3=168(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=246(x), r6=37(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=215(x), r11=200(y), r12=100(width), r13=38(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 123
LDI r1, 65
LDI r2, 304
LDI r3, 168
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 37
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 215
LDI r11, 200
LDI r12, 100
LDI r13, 38
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
