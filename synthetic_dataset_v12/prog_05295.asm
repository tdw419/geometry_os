; DESCRIPTION: Composite: Renders a yellow disk with center (386, 63) and radius 40 then Places a cyan 34x50 rectangle at position (122, 76) then Places a magenta line segment connecting (176, 66) to (182, 24).
; PLAN: r0=386(x), r1=63(y), r2=40(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=122(x), r6=76(y), r7=34(width), r8=50(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=176(x1), r11=66(y1), r12=182(x2), r13=24(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 63
LDI r2, 40
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 122
LDI r6, 76
LDI r7, 34
LDI r8, 50
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 66
LDI r12, 182
LDI r13, 24
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
