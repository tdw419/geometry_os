; DESCRIPTION: Composite: Places a orange dot at position (421, 231) then Renders a white line between points (257, 50) and (193, 55) then Renders a cyan box of size 16x11 starting at (353, 110).
; PLAN: r0=421(x), r1=231(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=257(x1), r6=50(y1), r7=193(x2), r8=55(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=353(x), r11=110(y), r12=16(width), r13=11(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 231
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 257
LDI r6, 50
LDI r7, 193
LDI r8, 55
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 353
LDI r11, 110
LDI r12, 16
LDI r13, 11
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
