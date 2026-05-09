; DESCRIPTION: Composite: Sets a single green pixel at (0, 200) then Places a yellow line segment connecting (56, 124) to (120, 81) then Creates a blue rectangular region at (384, 67) spanning 75 by 103 pixels.
; PLAN: r0=0(x), r1=200(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=56(x1), r6=124(y1), r7=120(x2), r8=81(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=384(x), r11=67(y), r12=75(width), r13=103(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 0
LDI r1, 200
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 56
LDI r6, 124
LDI r7, 120
LDI r8, 81
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 384
LDI r11, 67
LDI r12, 75
LDI r13, 103
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
