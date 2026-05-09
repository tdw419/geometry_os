; DESCRIPTION: Composite: Places a purple dot at position (40, 239) then Renders a orange line between points (409, 7) and (159, 134) then Places a white 10x23 rectangle at position (429, 220).
; PLAN: r0=40(x), r1=239(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=409(x1), r6=7(y1), r7=159(x2), r8=134(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=429(x), r11=220(y), r12=10(width), r13=23(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 40
LDI r1, 239
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 409
LDI r6, 7
LDI r7, 159
LDI r8, 134
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 429
LDI r11, 220
LDI r12, 10
LDI r13, 23
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
