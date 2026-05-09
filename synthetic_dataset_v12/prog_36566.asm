; DESCRIPTION: Composite: Renders a black disk with center (367, 128) and radius 23 then Places a cyan line segment connecting (428, 144) to (124, 191) then Places a red 81x52 rectangle at position (42, 12).
; PLAN: r0=367(x), r1=128(y), r2=23(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x1), r6=144(y1), r7=124(x2), r8=191(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=42(x), r11=12(y), r12=81(width), r13=52(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 128
LDI r2, 23
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 144
LDI r7, 124
LDI r8, 191
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 12
LDI r12, 81
LDI r13, 52
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
