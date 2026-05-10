; DESCRIPTION: Composite: Places a magenta dot at position (416, 48) then Draws a magenta line from (161, 139) to (15, 191) then Places a cyan circle of radius 56 at center (421, 102).
; PLAN: r0=416(x), r1=48(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=161(x1), r6=139(y1), r7=15(x2), r8=191(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=421(x), r11=102(y), r12=56(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 416
LDI r1, 48
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 161
LDI r6, 139
LDI r7, 15
LDI r8, 191
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 421
LDI r11, 102
LDI r12, 56
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
