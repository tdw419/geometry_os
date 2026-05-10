; DESCRIPTION: Composite: Places a green 59x86 rectangle at position (124, 48) then Renders a purple line between points (301, 183) and (247, 60) then Places a cyan circle of radius 67 at center (334, 152).
; PLAN: r0=124(x), r1=48(y), r2=59(width), r3=86(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x1), r6=183(y1), r7=247(x2), r8=60(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=334(x), r11=152(y), r12=67(radius), r13=0x00FFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 124
LDI r1, 48
LDI r2, 59
LDI r3, 86
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 183
LDI r7, 247
LDI r8, 60
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 334
LDI r11, 152
LDI r12, 67
LDI r13, 0x00FFFF
CIRCLE r10, r11, r12, r13
HALT
