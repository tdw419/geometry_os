; DESCRIPTION: Composite: Draws a white line from (285, 116) to (176, 0) then Creates a orange rectangular region at (392, 166) spanning 60 by 81 pixels.
; PLAN: r0=285(x1), r1=116(y1), r2=176(x2), r3=0(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=392(x), r6=166(y), r7=60(width), r8=81(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 285
LDI r1, 116
LDI r2, 176
LDI r3, 0
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 166
LDI r7, 60
LDI r8, 81
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
