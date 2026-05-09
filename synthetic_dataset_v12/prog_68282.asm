; DESCRIPTION: Composite: Renders a yellow disk with center (331, 68) and radius 19 then Renders a cyan box of size 81x59 starting at (249, 153) then Renders a white line between points (397, 191) and (161, 38).
; PLAN: r0=331(x), r1=68(y), r2=19(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=249(x), r6=153(y), r7=81(width), r8=59(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=397(x1), r11=191(y1), r12=161(x2), r13=38(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 331
LDI r1, 68
LDI r2, 19
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 249
LDI r6, 153
LDI r7, 81
LDI r8, 59
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 191
LDI r12, 161
LDI r13, 38
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
