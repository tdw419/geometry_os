; DESCRIPTION: Composite: Draws a purple line from (471, 47) to (101, 120) then Draws a purple circle centered at (168, 228) with radius 28 then Renders a purple box of size 34x76 starting at (93, 3).
; PLAN: r0=471(x1), r1=47(y1), r2=101(x2), r3=120(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=168(x), r6=228(y), r7=28(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=93(x), r11=3(y), r12=34(width), r13=76(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 471
LDI r1, 47
LDI r2, 101
LDI r3, 120
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 168
LDI r6, 228
LDI r7, 28
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 93
LDI r11, 3
LDI r12, 34
LDI r13, 76
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
