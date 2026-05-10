; DESCRIPTION: Composite: Creates a magenta rectangular region at (326, 49) spanning 35 by 52 pixels then Renders a green line between points (288, 4) and (124, 12) then Sets a single white pixel at (422, 208).
; PLAN: r0=326(x), r1=49(y), r2=35(width), r3=52(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=288(x1), r6=4(y1), r7=124(x2), r8=12(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=422(x), r11=208(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 326
LDI r1, 49
LDI r2, 35
LDI r3, 52
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 288
LDI r6, 4
LDI r7, 124
LDI r8, 12
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 422
LDI r11, 208
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
