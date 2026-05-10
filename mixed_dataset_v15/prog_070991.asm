; DESCRIPTION: Composite: Places a red dot at position (305, 28) then Places a purple 80x100 rectangle at position (362, 19) then Creates a orange circular shape at (450, 76) with radius 47.
; PLAN: r0=305(x), r1=28(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=362(x), r6=19(y), r7=80(width), r8=100(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=450(x), r11=76(y), r12=47(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 305
LDI r1, 28
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 362
LDI r6, 19
LDI r7, 80
LDI r8, 100
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 450
LDI r11, 76
LDI r12, 47
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
