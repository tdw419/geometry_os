; DESCRIPTION: Composite: Creates a yellow circular shape at (246, 164) with radius 45 then Renders a red line between points (379, 34) and (209, 67) then Creates a magenta rectangular region at (216, 168) spanning 89 by 46 pixels.
; PLAN: r0=246(x), r1=164(y), r2=45(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x1), r6=34(y1), r7=209(x2), r8=67(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=216(x), r11=168(y), r12=89(width), r13=46(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 246
LDI r1, 164
LDI r2, 45
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 34
LDI r7, 209
LDI r8, 67
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 216
LDI r11, 168
LDI r12, 89
LDI r13, 46
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
