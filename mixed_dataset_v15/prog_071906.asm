; DESCRIPTION: Composite: Renders a magenta disk with center (269, 106) and radius 29 then Renders a magenta line between points (261, 9) and (124, 58) then Renders a green box of size 25x77 starting at (90, 117).
; PLAN: r0=269(x), r1=106(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=261(x1), r6=9(y1), r7=124(x2), r8=58(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=90(x), r11=117(y), r12=25(width), r13=77(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 269
LDI r1, 106
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 261
LDI r6, 9
LDI r7, 124
LDI r8, 58
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 90
LDI r11, 117
LDI r12, 25
LDI r13, 77
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
