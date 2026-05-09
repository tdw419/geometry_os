; DESCRIPTION: Composite: Renders a white line between points (410, 99) and (453, 139) then Renders a magenta box of size 90x86 starting at (262, 111) then Renders a purple disk with center (189, 190) and radius 61.
; PLAN: r0=410(x1), r1=99(y1), r2=453(x2), r3=139(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=262(x), r6=111(y), r7=90(width), r8=86(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=189(x), r11=190(y), r12=61(radius), r13=0xAA00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 410
LDI r1, 99
LDI r2, 453
LDI r3, 139
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 262
LDI r6, 111
LDI r7, 90
LDI r8, 86
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 189
LDI r11, 190
LDI r12, 61
LDI r13, 0xAA00FF
CIRCLE r10, r11, r12, r13
HALT
