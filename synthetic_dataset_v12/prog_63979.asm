; DESCRIPTION: Composite: Renders a black line between points (60, 40) and (38, 161) then Creates a magenta rectangular region at (312, 45) spanning 103 by 44 pixels.
; PLAN: r0=60(x1), r1=40(y1), r2=38(x2), r3=161(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=312(x), r6=45(y), r7=103(width), r8=44(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 60
LDI r1, 40
LDI r2, 38
LDI r3, 161
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 312
LDI r6, 45
LDI r7, 103
LDI r8, 44
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
