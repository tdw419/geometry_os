; DESCRIPTION: Composite: Places a magenta 107x38 rectangle at position (39, 62) then Sets a single magenta pixel at (84, 42) then Places a green line segment connecting (342, 27) to (291, 228).
; PLAN: r0=39(x), r1=62(y), r2=107(width), r3=38(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x), r6=42(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=342(x1), r11=27(y1), r12=291(x2), r13=228(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 39
LDI r1, 62
LDI r2, 107
LDI r3, 38
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 42
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 342
LDI r11, 27
LDI r12, 291
LDI r13, 228
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
