; DESCRIPTION: Composite: Renders a orange line between points (61, 45) and (317, 85) then Sets a single magenta pixel at (43, 5) then Places a green 43x24 rectangle at position (154, 107).
; PLAN: r0=61(x1), r1=45(y1), r2=317(x2), r3=85(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=43(x), r6=5(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=154(x), r11=107(y), r12=43(width), r13=24(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 61
LDI r1, 45
LDI r2, 317
LDI r3, 85
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 5
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 154
LDI r11, 107
LDI r12, 43
LDI r13, 24
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
