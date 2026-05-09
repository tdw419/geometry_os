; DESCRIPTION: Composite: Places a purple line segment connecting (273, 214) to (213, 0) then Places a magenta circle of radius 59 at center (387, 195) then Renders a cyan box of size 91x60 starting at (68, 137).
; PLAN: r0=273(x1), r1=214(y1), r2=213(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=387(x), r6=195(y), r7=59(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=68(x), r11=137(y), r12=91(width), r13=60(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 273
LDI r1, 214
LDI r2, 213
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 387
LDI r6, 195
LDI r7, 59
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 68
LDI r11, 137
LDI r12, 91
LDI r13, 60
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
