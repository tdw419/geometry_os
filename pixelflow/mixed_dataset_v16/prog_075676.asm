; DESCRIPTION: Composite: Places a green line segment connecting (73, 137) to (422, 120) then Creates a black rectangular region at (207, 193) spanning 66 by 44 pixels.
; PLAN: r0=73(x1), r1=137(y1), r2=422(x2), r3=120(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=207(x), r6=193(y), r7=66(width), r8=44(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 73
LDI r1, 137
LDI r2, 422
LDI r3, 120
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 193
LDI r7, 66
LDI r8, 44
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
