; DESCRIPTION: Composite: Draws a magenta circle centered at (445, 128) with radius 20 then Renders a magenta line between points (384, 180) and (205, 74) then Creates a magenta rectangular region at (387, 138) spanning 77 by 86 pixels.
; PLAN: r0=445(x), r1=128(y), r2=20(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=384(x1), r6=180(y1), r7=205(x2), r8=74(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=387(x), r11=138(y), r12=77(width), r13=86(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 445
LDI r1, 128
LDI r2, 20
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 384
LDI r6, 180
LDI r7, 205
LDI r8, 74
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 387
LDI r11, 138
LDI r12, 77
LDI r13, 86
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
