; DESCRIPTION: Composite: Places a purple line segment connecting (406, 148) to (346, 164) then Creates a purple rectangular region at (148, 137) spanning 83 by 21 pixels.
; PLAN: r0=406(x1), r1=148(y1), r2=346(x2), r3=164(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=137(y), r7=83(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 406
LDI r1, 148
LDI r2, 346
LDI r3, 164
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 137
LDI r7, 83
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
