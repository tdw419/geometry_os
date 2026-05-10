; DESCRIPTION: Composite: Renders a cyan box of size 98x40 starting at (176, 14) then Renders a magenta disk with center (368, 149) and radius 37 then Renders a magenta line between points (451, 247) and (10, 34).
; PLAN: r0=176(x), r1=14(y), r2=98(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=149(y), r7=37(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=451(x1), r11=247(y1), r12=10(x2), r13=34(y2), r14=0xFF00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 176
LDI r1, 14
LDI r2, 98
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 149
LDI r7, 37
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 451
LDI r11, 247
LDI r12, 10
LDI r13, 34
LDI r14, 0xFF00FF
LINE r10, r11, r12, r13, r14
HALT
