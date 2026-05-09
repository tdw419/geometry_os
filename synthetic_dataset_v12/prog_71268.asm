; DESCRIPTION: Composite: Creates a blue rectangular region at (261, 28) spanning 94 by 59 pixels then Renders a cyan line between points (466, 227) and (190, 111) then Renders a red disk with center (73, 184) and radius 65.
; PLAN: r0=261(x), r1=28(y), r2=94(width), r3=59(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=466(x1), r6=227(y1), r7=190(x2), r8=111(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=73(x), r11=184(y), r12=65(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 261
LDI r1, 28
LDI r2, 94
LDI r3, 59
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 466
LDI r6, 227
LDI r7, 190
LDI r8, 111
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 73
LDI r11, 184
LDI r12, 65
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
