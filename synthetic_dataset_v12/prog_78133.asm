; DESCRIPTION: Composite: Renders a green box of size 99x57 starting at (290, 9) then Draws a cyan circle centered at (284, 167) with radius 56 then Draws a black line from (84, 46) to (406, 53).
; PLAN: r0=290(x), r1=9(y), r2=99(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=284(x), r6=167(y), r7=56(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=84(x1), r11=46(y1), r12=406(x2), r13=53(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 290
LDI r1, 9
LDI r2, 99
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 284
LDI r6, 167
LDI r7, 56
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 84
LDI r11, 46
LDI r12, 406
LDI r13, 53
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
