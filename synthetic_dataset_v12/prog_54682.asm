; DESCRIPTION: Composite: Creates a white circular shape at (117, 63) with radius 61 then Places a orange 59x106 rectangle at position (305, 64) then Places a orange line segment connecting (122, 228) to (494, 65).
; PLAN: r0=117(x), r1=63(y), r2=61(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=305(x), r6=64(y), r7=59(width), r8=106(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=122(x1), r11=228(y1), r12=494(x2), r13=65(y2), r14=0xFF8800(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 117
LDI r1, 63
LDI r2, 61
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 305
LDI r6, 64
LDI r7, 59
LDI r8, 106
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 122
LDI r11, 228
LDI r12, 494
LDI r13, 65
LDI r14, 0xFF8800
LINE r10, r11, r12, r13, r14
HALT
