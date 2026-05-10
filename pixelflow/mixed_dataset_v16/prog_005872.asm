; DESCRIPTION: Composite: Creates a orange circular shape at (383, 80) with radius 51 then Draws a green line from (143, 18) to (485, 131) then Places a cyan 83x72 rectangle at position (182, 16).
; PLAN: r0=383(x), r1=80(y), r2=51(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=143(x1), r6=18(y1), r7=485(x2), r8=131(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=182(x), r11=16(y), r12=83(width), r13=72(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 383
LDI r1, 80
LDI r2, 51
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 143
LDI r6, 18
LDI r7, 485
LDI r8, 131
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 182
LDI r11, 16
LDI r12, 83
LDI r13, 72
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
