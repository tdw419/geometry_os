; DESCRIPTION: Composite: Places a green 100x41 rectangle at position (10, 120) then Places a yellow dot at position (362, 156) then Renders a white line between points (375, 27) and (257, 168).
; PLAN: r0=10(x), r1=120(y), r2=100(width), r3=41(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x), r6=156(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=375(x1), r11=27(y1), r12=257(x2), r13=168(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 10
LDI r1, 120
LDI r2, 100
LDI r3, 41
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 156
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 375
LDI r11, 27
LDI r12, 257
LDI r13, 168
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
