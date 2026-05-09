; DESCRIPTION: Composite: Places a orange line segment connecting (337, 69) to (176, 159) then Creates a orange circular shape at (398, 161) with radius 29.
; PLAN: r0=337(x1), r1=69(y1), r2=176(x2), r3=159(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=398(x), r6=161(y), r7=29(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 337
LDI r1, 69
LDI r2, 176
LDI r3, 159
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 161
LDI r7, 29
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
