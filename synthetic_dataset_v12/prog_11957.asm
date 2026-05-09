; DESCRIPTION: Composite: Sets a single white pixel at (470, 73) then Places a yellow line segment connecting (21, 40) to (504, 30) then Places a green 62x31 rectangle at position (210, 176).
; PLAN: r0=470(x), r1=73(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=21(x1), r6=40(y1), r7=504(x2), r8=30(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=210(x), r11=176(y), r12=62(width), r13=31(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 470
LDI r1, 73
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 21
LDI r6, 40
LDI r7, 504
LDI r8, 30
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 210
LDI r11, 176
LDI r12, 62
LDI r13, 31
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
