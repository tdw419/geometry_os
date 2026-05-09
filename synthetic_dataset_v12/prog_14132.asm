; DESCRIPTION: Composite: Places a yellow line segment connecting (5, 142) to (346, 33) then Creates a orange rectangular region at (416, 138) spanning 56 by 90 pixels.
; PLAN: r0=5(x1), r1=142(y1), r2=346(x2), r3=33(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=416(x), r6=138(y), r7=56(width), r8=90(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 5
LDI r1, 142
LDI r2, 346
LDI r3, 33
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 416
LDI r6, 138
LDI r7, 56
LDI r8, 90
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
