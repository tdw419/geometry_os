; DESCRIPTION: Composite: Creates a white circular shape at (214, 59) with radius 30 then Places a white 36x15 rectangle at position (37, 61) then Renders a black line between points (182, 0) and (429, 3).
; PLAN: r0=214(x), r1=59(y), r2=30(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=37(x), r6=61(y), r7=36(width), r8=15(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=182(x1), r11=0(y1), r12=429(x2), r13=3(y2), r14=0x000000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 214
LDI r1, 59
LDI r2, 30
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 37
LDI r6, 61
LDI r7, 36
LDI r8, 15
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 0
LDI r12, 429
LDI r13, 3
LDI r14, 0x000000
LINE r10, r11, r12, r13, r14
HALT
