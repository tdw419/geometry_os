; DESCRIPTION: Composite: Creates a cyan circular shape at (198, 170) with radius 78 then Places a red dot at position (243, 121) then Places a red line segment connecting (417, 114) to (228, 59).
; PLAN: r0=198(x), r1=170(y), r2=78(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=243(x), r6=121(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=417(x1), r11=114(y1), r12=228(x2), r13=59(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 198
LDI r1, 170
LDI r2, 78
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 243
LDI r6, 121
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 417
LDI r11, 114
LDI r12, 228
LDI r13, 59
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
