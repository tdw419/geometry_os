; DESCRIPTION: Composite: Places a yellow line segment connecting (242, 7) to (406, 104) then Draws a orange rectangle at (480, 11) with width 32 and height 82 then Places a magenta circle of radius 49 at center (356, 198).
; PLAN: r0=242(x1), r1=7(y1), r2=406(x2), r3=104(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=480(x), r6=11(y), r7=32(width), r8=82(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x), r11=198(y), r12=49(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 242
LDI r1, 7
LDI r2, 406
LDI r3, 104
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 480
LDI r6, 11
LDI r7, 32
LDI r8, 82
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 198
LDI r12, 49
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
