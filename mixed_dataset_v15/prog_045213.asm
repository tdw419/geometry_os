; DESCRIPTION: Composite: Renders a orange disk with center (82, 76) and radius 57 then Draws a red line from (14, 30) to (400, 219) then Creates a magenta rectangular region at (48, 7) spanning 30 by 81 pixels.
; PLAN: r0=82(x), r1=76(y), r2=57(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x1), r6=30(y1), r7=400(x2), r8=219(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=48(x), r11=7(y), r12=30(width), r13=81(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 82
LDI r1, 76
LDI r2, 57
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 30
LDI r7, 400
LDI r8, 219
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 48
LDI r11, 7
LDI r12, 30
LDI r13, 81
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
