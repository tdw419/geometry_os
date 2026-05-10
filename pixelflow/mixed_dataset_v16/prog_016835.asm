; DESCRIPTION: Composite: Places a magenta 29x90 rectangle at position (412, 64) then Places a orange line segment connecting (212, 28) to (76, 214) then Sets a single magenta pixel at (301, 15).
; PLAN: r0=412(x), r1=64(y), r2=29(width), r3=90(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=212(x1), r6=28(y1), r7=76(x2), r8=214(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=301(x), r11=15(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 412
LDI r1, 64
LDI r2, 29
LDI r3, 90
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 212
LDI r6, 28
LDI r7, 76
LDI r8, 214
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 301
LDI r11, 15
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
