; DESCRIPTION: Composite: Places a purple circle of radius 60 at center (241, 192) then Creates a green rectangular region at (383, 54) spanning 77 by 70 pixels then Renders a cyan line between points (321, 233) and (354, 195).
; PLAN: r0=241(x), r1=192(y), r2=60(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=383(x), r6=54(y), r7=77(width), r8=70(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=321(x1), r11=233(y1), r12=354(x2), r13=195(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 241
LDI r1, 192
LDI r2, 60
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 383
LDI r6, 54
LDI r7, 77
LDI r8, 70
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 321
LDI r11, 233
LDI r12, 354
LDI r13, 195
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
