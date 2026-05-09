; DESCRIPTION: Composite: Places a white 53x59 rectangle at position (390, 82) then Sets a single orange pixel at (398, 53) then Renders a red line between points (477, 16) and (449, 173).
; PLAN: r0=390(x), r1=82(y), r2=53(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=398(x), r6=53(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=477(x1), r11=16(y1), r12=449(x2), r13=173(y2), r14=0xFF0000(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 390
LDI r1, 82
LDI r2, 53
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 53
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 477
LDI r11, 16
LDI r12, 449
LDI r13, 173
LDI r14, 0xFF0000
LINE r10, r11, r12, r13, r14
HALT
